module RailsLti2Provider
  class Tool < ActiveRecord::Base
    attr_accessible :uuid, :shared_secret, :lti_version, :tool_settings, :notes

    before_validation :autogenerate
    validates_presence_of :lti_version

    serialize :tool_settings
    has_many :lti_launches
    has_many :registrations

    def tool_proxy
      IMS::LTI::Models::ToolProxy.from_json(tool_settings)
    end

    # Rails Admin
    def lti_version_enum
      ['LTI-1p0', 'LTI-2p0']
    end

    private
    def autogenerate
      self.uuid = SecureRandom.uuid if uuid.blank?
      self.shared_secret = SecureRandom.hex(16) if shared_secret.blank?
      self.tool_settings = 'none' if tool_settings.blank?
    end
  end
end

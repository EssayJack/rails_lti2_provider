class CreateLti2ProviderTables < ActiveRecord::Migration
  def change
    create_table "rails_lti2_provider_tools" do |t|
      t.string   "uuid"
      t.text     "shared_secret"
      t.text     "tool_settings"
      t.string   "lti_version"
      t.text     "notes"

      t.timestamps
    end

    create_table "rails_lti2_provider_lti_launches" do |t|
      t.integer  "tool_id",                     limit: 8
      t.string   "nonce"
      t.text     "message"

      t.timestamps
    end

    create_table "rails_lti2_provider_registrations" do |t|
      t.string   "uuid"
      t.text     "registration_request_params"
      t.text     "tool_proxy_json"
      t.string   "workflow_state"
      t.integer  "tool_id",                     limit: 8
      t.text     "correlation_id"

      t.timestamps
    end

    create_table "rails_lti2_provider_tool_proxies" do |t|
      t.string   "uuid"
      t.string   "shared_secret"
      t.text     "proxy_json"

      t.timestamps
    end
  end
end

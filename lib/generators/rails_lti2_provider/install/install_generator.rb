require 'rails/generators'
require 'rails/generators/migration'

class RailsLti2Provider::InstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_product_instance_json
    template "product_instance.json.erb", "config/product_instance.json"
  end

  def copy_migrations
    migration_template "create_lti2_tables.rb", "db/migrate/create_lti2_tables.rb"
  end

  private
  def uuid
    SecureRandom.uuid
  end

  def created_at
    Time.now.xmlschema
  end

end

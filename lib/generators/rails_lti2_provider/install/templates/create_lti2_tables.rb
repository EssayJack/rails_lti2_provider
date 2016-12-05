class CreateLti2ProviderTables < ActiveRecord::Migration
  def change
    create_table "rails_lti2_provider_lti_launches" do |t|
      t.string   "tool_proxy_id"
      t.string   "nonce"
      t.text     "message"

      t.timestamps
    end

    create_table "rails_lti2_provider_registrations" do |t|
      t.string   "uuid"
      t.text     "registration_request_params"
      t.text     "tool_proxy_json"
      t.string   "workflow_state"

      t.timestamps
    end

    create_table "rails_lti2_provider_tool_proxies" do |t|
      t.string   "uuid"
      t.string   "shared_secret"
      t.text     "proxy_json"

      t.timestamps
    end

    add_index "rails_lti2_provider_registrations", ["correlation_id"], name: "index_rails_lti2_provider_registrations_on_correlation_id", unique: true, using: :btree
  end
end

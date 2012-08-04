# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120721153832) do

  create_table "attribute_types", :force => true do |t|
    t.string   "internal_identifier"
    t.string   "description"
    t.string   "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attribute_types", ["internal_identifier"], :name => ":attribute_types_iid_idx"

  create_table "attribute_values", :force => true do |t|
    t.integer  "attributed_record_id"
    t.string   "attributed_record_type"
    t.integer  "attribute_type_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attribute_values", ["attribute_type_id"], :name => "attribute_values_attributed_type_idx"
  add_index "attribute_values", ["attributed_record_id", "attributed_record_type"], :name => "attribute_values_attributed_record_idx"
  add_index "attribute_values", ["value"], :name => "attribute_values_value_idx"

  create_table "audit_log_item_types", :force => true do |t|
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.string   "description"
    t.string   "comments"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audit_log_items", :force => true do |t|
    t.integer  "audit_log_id"
    t.integer  "audit_log_item_type_id"
    t.string   "audit_log_item_value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audit_log_types", :force => true do |t|
    t.string   "description"
    t.string   "error_code"
    t.string   "comments"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audit_logs", :force => true do |t|
    t.string   "application"
    t.string   "description"
    t.integer  "party_id"
    t.text     "additional_info"
    t.integer  "audit_log_type_id"
    t.integer  "event_record_id"
    t.string   "event_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audit_logs", ["event_record_id", "event_record_type"], :name => "event_record_index"
  add_index "audit_logs", ["party_id"], :name => "index_audit_logs_on_party_id"

  create_table "capabilities", :force => true do |t|
    t.string   "resource"
    t.integer  "capability_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capabilities", ["capability_type_id"], :name => "index_capabilities_on_capability_type_id"

  create_table "capabilities_capable_models", :id => false, :force => true do |t|
    t.integer  "capable_model_id"
    t.integer  "capability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capabilities_capable_models", ["capability_id"], :name => "index_capabilities_capable_models_on_capability_id"
  add_index "capabilities_capable_models", ["capable_model_id"], :name => "index_capabilities_capable_models_on_capable_model_id"

  create_table "capability_types", :force => true do |t|
    t.string   "internal_identifier"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "capable_models", :force => true do |t|
    t.integer  "capable_model_record_id"
    t.string   "capable_model_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capable_models", ["capable_model_record_id", "capable_model_record_type"], :name => "capable_model_record_idx"

  create_table "categories", :force => true do |t|
    t.string   "description"
    t.string   "external_identifier"
    t.datetime "from_date"
    t.datetime "to_date"
    t.string   "internal_identifier"
    t.integer  "category_record_id"
    t.string   "category_record_type"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["category_record_id", "category_record_type"], :name => "category_polymorphic"

  create_table "category_classifications", :force => true do |t|
    t.integer  "category_id"
    t.string   "classification_type"
    t.integer  "classification_id"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_classifications", ["classification_id", "classification_type"], :name => "classification_polymorphic"

  create_table "compass_ae_instances", :force => true do |t|
    t.decimal  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_purposes", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "description"
    t.string   "comments"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_purposes", ["parent_id"], :name => "index_contact_purposes_on_parent_id"

  create_table "contact_purposes_contacts", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "contact_purpose_id"
  end

  add_index "contact_purposes_contacts", ["contact_id", "contact_purpose_id"], :name => "contact_purposes_contacts_index"

  create_table "contact_types", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "description"
    t.string   "comments"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_types", ["parent_id"], :name => "index_contact_types_on_parent_id"

  create_table "contacts", :force => true do |t|
    t.integer  "party_id"
    t.integer  "contact_mechanism_id"
    t.string   "contact_mechanism_type"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["contact_mechanism_id", "contact_mechanism_type"], :name => "besi_2"
  add_index "contacts", ["party_id"], :name => "index_contacts_on_party_id"

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.string   "definition"
    t.string   "internal_identifier"
    t.string   "numeric_code"
    t.string   "major_unit_symbol"
    t.string   "minor_unit_symbol"
    t.string   "ratio_of_minor_unit_to_major_unit"
    t.string   "postfix_label"
    t.datetime "introduction_date"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "currencies", ["internal_identifier"], :name => "index_currencies_on_internal_identifier"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "descriptive_assets", :force => true do |t|
    t.integer  "view_type_id"
    t.string   "internal_identifier"
    t.text     "description"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.integer  "described_record_id"
    t.string   "described_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "descriptive_assets", ["described_record_id", "described_record_type"], :name => "described_record_idx"
  add_index "descriptive_assets", ["view_type_id"], :name => "index_descriptive_assets_on_view_type_id"

  create_table "email_addresses", :force => true do |t|
    t.string   "email_address"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_assets", :force => true do |t|
    t.integer  "file_asset_holder_id"
    t.string   "file_asset_holder_type"
    t.string   "type"
    t.string   "name"
    t.string   "directory"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_assets", ["directory"], :name => "index_file_assets_on_directory"
  add_index "file_assets", ["file_asset_holder_id", "file_asset_holder_type"], :name => "file_asset_holder_idx"
  add_index "file_assets", ["name"], :name => "index_file_assets_on_name"
  add_index "file_assets", ["type"], :name => "index_file_assets_on_type"

  create_table "geo_countries", :force => true do |t|
    t.string   "name"
    t.string   "iso_code_2"
    t.string   "iso_code_3"
    t.boolean  "display",     :default => true
    t.integer  "external_id"
    t.datetime "created_at"
  end

  add_index "geo_countries", ["iso_code_2"], :name => "index_geo_countries_on_iso_code_2"
  add_index "geo_countries", ["name"], :name => "index_geo_countries_on_name"

  create_table "geo_zones", :force => true do |t|
    t.integer  "geo_country_id"
    t.string   "zone_code",      :default => "2"
    t.string   "zone_name"
    t.datetime "created_at"
  end

  add_index "geo_zones", ["geo_country_id"], :name => "index_geo_zones_on_geo_country_id"
  add_index "geo_zones", ["zone_code"], :name => "index_geo_zones_on_zone_code"
  add_index "geo_zones", ["zone_name"], :name => "index_geo_zones_on_zone_name"

  create_table "individuals", :force => true do |t|
    t.integer  "party_id"
    t.string   "current_last_name"
    t.string   "current_first_name"
    t.string   "current_middle_name"
    t.string   "current_personal_title"
    t.string   "current_suffix"
    t.string   "current_nickname"
    t.string   "gender",                       :limit => 1
    t.date     "birth_date"
    t.decimal  "height",                                    :precision => 5, :scale => 2
    t.integer  "weight"
    t.string   "mothers_maiden_name"
    t.string   "marital_status",               :limit => 1
    t.string   "social_security_number"
    t.integer  "current_passport_number"
    t.date     "current_passport_expire_date"
    t.integer  "total_years_work_experience"
    t.string   "comments"
    t.string   "encrypted_ssn"
    t.string   "temp_ssn"
    t.string   "salt"
    t.string   "ssn_last_four"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individuals", ["party_id"], :name => "index_individuals_on_party_id"

  create_table "money", :force => true do |t|
    t.string   "description"
    t.decimal  "amount",      :precision => 8, :scale => 2
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "money", ["currency_id"], :name => "index_money_on_currency_id"

  create_table "note_types", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "description"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.integer  "note_type_record_id"
    t.string   "note_type_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_types", ["note_type_record_id", "note_type_record_type"], :name => "note_type_record_idx"

  create_table "notes", :force => true do |t|
    t.integer  "created_by_id"
    t.text     "content"
    t.integer  "noted_record_id"
    t.string   "noted_record_type"
    t.integer  "note_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["created_by_id"], :name => "index_notes_on_created_by_id"
  add_index "notes", ["note_type_id"], :name => "index_notes_on_note_type_id"
  add_index "notes", ["noted_record_id", "noted_record_type"], :name => "index_notes_on_noted_record_id_and_noted_record_type"

  create_table "order_items", :force => true do |t|
    t.string   "description"
    t.integer  "party_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["party_order_id"], :name => "index_order_items_on_party_order_id"

  create_table "orders", :force => true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "description"
    t.string   "tax_id_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "description"
    t.integer  "business_party_id"
    t.string   "business_party_type"
    t.integer  "list_view_image_id"
    t.string   "enterprise_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parties", ["business_party_id", "business_party_type"], :name => "besi_1"

  create_table "party_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "party_orders", ["order_id"], :name => "index_party_orders_on_order_id"
  add_index "party_orders", ["party_id"], :name => "index_party_orders_on_party_id"

  create_table "party_relationships", :force => true do |t|
    t.string   "description"
    t.integer  "party_id_from"
    t.integer  "party_id_to"
    t.integer  "role_type_id_from"
    t.integer  "role_type_id_to"
    t.integer  "status_type_id"
    t.integer  "priority_type_id"
    t.integer  "relationship_type_id"
    t.date     "from_date"
    t.date     "thru_date"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "party_relationships", ["priority_type_id"], :name => "index_party_relationships_on_priority_type_id"
  add_index "party_relationships", ["relationship_type_id"], :name => "index_party_relationships_on_relationship_type_id"
  add_index "party_relationships", ["status_type_id"], :name => "index_party_relationships_on_status_type_id"

  create_table "party_roles", :force => true do |t|
    t.string   "type"
    t.integer  "party_id"
    t.integer  "role_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "party_roles", ["party_id"], :name => "index_party_roles_on_party_id"
  add_index "party_roles", ["role_type_id"], :name => "index_party_roles_on_role_type_id"

  create_table "party_search_facts", :force => true do |t|
    t.integer  "party_id"
    t.string   "eid"
    t.string   "type"
    t.text     "roles"
    t.string   "party_description"
    t.string   "party_business_party_type"
    t.string   "user_login"
    t.string   "individual_current_last_name"
    t.string   "individual_current_first_name"
    t.string   "individual_current_middle_name"
    t.string   "individual_birth_date"
    t.string   "individual_ssn"
    t.string   "party_phone_number"
    t.string   "party_email_address"
    t.string   "party_address_1"
    t.string   "party_address_2"
    t.string   "party_primary_address_city"
    t.string   "party_primary_address_state"
    t.string   "party_primary_address_zip"
    t.string   "party_primary_address_country"
    t.boolean  "user_enabled"
    t.string   "user_type"
    t.boolean  "reindex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "phone_number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postal_addresses", :force => true do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "description"
    t.integer  "geo_country_id"
    t.integer  "geo_zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postal_addresses", ["geo_country_id"], :name => "index_postal_addresses_on_geo_country_id"
  add_index "postal_addresses", ["geo_zone_id"], :name => "index_postal_addresses_on_geo_zone_id"

  create_table "relationship_types", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "valid_from_role_type_id"
    t.integer  "valid_to_role_type_id"
    t.string   "name"
    t.string   "description"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationship_types", ["valid_from_role_type_id"], :name => "index_relationship_types_on_valid_from_role_type_id"
  add_index "relationship_types", ["valid_to_role_type_id"], :name => "index_relationship_types_on_valid_to_role_type_id"

  create_table "role_types", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "description"
    t.string   "comments"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "description"
    t.string   "internal_identifier"
    t.string   "external_identifier"
    t.string   "external_id_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_secured_models", :id => false, :force => true do |t|
    t.integer  "secured_model_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_secured_models", ["role_id"], :name => "index_roles_secured_models_on_role_id"
  add_index "roles_secured_models", ["secured_model_id"], :name => "index_roles_secured_models_on_secured_model_id"

  create_table "secured_models", :force => true do |t|
    t.integer  "secured_record_id"
    t.string   "secured_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "secured_models", ["secured_record_id", "secured_record_type"], :name => "secured_record_idx"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "toppings", :force => true do |t|
    t.string   "description"
    t.integer  "order_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "toppings", ["order_item_id"], :name => "index_toppings_on_order_item_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "party_id"
    t.string   "type"
    t.string   "salt"
    t.string   "crypted_password"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.integer  "failed_logins_count",             :default => 0
    t.datetime "lock_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "security_question_1"
    t.string   "security_answer_1"
    t.string   "security_question_2"
    t.string   "security_answer_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["last_logout_at", "last_activity_at"], :name => "activity_idx"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "valid_note_types", :force => true do |t|
    t.integer  "valid_note_type_record_id"
    t.string   "valid_note_type_record_type"
    t.integer  "note_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "valid_note_types", ["note_type_id"], :name => "index_valid_note_types_on_note_type_id"
  add_index "valid_note_types", ["valid_note_type_record_id", "valid_note_type_record_type"], :name => "valid_note_type_record_idx"

  create_table "view_types", :force => true do |t|
    t.string   "internal_identifier"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(:version => 20120503183431) do

  create_table "app_containers", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.string   "internal_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "app_containers", ["type"], :name => "index_app_containers_on_type"
  add_index "app_containers", ["user_id"], :name => "index_app_containers_on_user_id"

  create_table "app_containers_applications", :id => false, :force => true do |t|
    t.integer  "app_container_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_containers_applications", ["app_container_id"], :name => "index_app_containers_applications_on_app_container_id"
  add_index "app_containers_applications", ["application_id"], :name => "index_app_containers_applications_on_application_id"

  create_table "applications", :force => true do |t|
    t.string   "description"
    t.string   "icon"
    t.string   "internal_identifier"
    t.string   "javascript_class_name"
    t.string   "shortcut_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "base_url"
  end

  create_table "applications_widgets", :id => false, :force => true do |t|
    t.integer  "application_id"
    t.integer  "widget_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications_widgets", ["application_id"], :name => "index_applications_widgets_on_application_id"
  add_index "applications_widgets", ["widget_id"], :name => "index_applications_widgets_on_widget_id"

  create_table "attribute_types", :force => true do |t|
    t.string   "internal_identifier"
    t.string   "description"
    t.string   "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attribute_values", :force => true do |t|
    t.integer  "attributed_record_id"
    t.string   "attributed_record_type"
    t.integer  "attribute_type_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "comments", :force => true do |t|
    t.string   "commentor_name"
    t.string   "email"
    t.text     "comment"
    t.integer  "approved"
    t.datetime "approved_at"
    t.integer  "user_id"
    t.integer  "commented_record_id"
    t.string   "commented_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["approved"], :name => "index_comments_on_approved"
  add_index "comments", ["commented_record_id", "commented_record_type"], :name => "commented_record_idx"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "compass_ae_instances", :force => true do |t|
    t.decimal  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configuration_item_types", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "description"
    t.string   "internal_identifier"
    t.boolean  "allow_user_defined_options", :default => false
    t.boolean  "is_multi_optional",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configuration_item_types_configuration_options", :force => true do |t|
    t.integer  "configuration_item_type_id"
    t.integer  "configuration_option_id"
    t.boolean  "is_default",                 :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "configuration_item_types_configuration_options", ["configuration_item_type_id"], :name => "conf_item_type_conf_opt_id_item_idx"
  add_index "configuration_item_types_configuration_options", ["configuration_option_id"], :name => "conf_item_type_conf_opt_id_opt_idx"

  create_table "configuration_item_types_configurations", :id => false, :force => true do |t|
    t.integer "configuration_item_type_id"
    t.integer "configuration_id"
  end

  add_index "configuration_item_types_configurations", ["configuration_id"], :name => "conf_id_idx"
  add_index "configuration_item_types_configurations", ["configuration_item_type_id", "configuration_id"], :name => "conf_config_type_uniq_idx", :unique => true
  add_index "configuration_item_types_configurations", ["configuration_item_type_id"], :name => "conf_conf_type_id_item_idx"

  create_table "configuration_items", :force => true do |t|
    t.integer  "configuration_id"
    t.integer  "configuration_item_type_id"
    t.integer  "configuration_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "configuration_items", ["configuration_id"], :name => "index_configuration_items_on_configuration_id"
  add_index "configuration_items", ["configuration_item_type_id"], :name => "index_configuration_items_on_configuration_item_type_id"
  add_index "configuration_items", ["configuration_option_id"], :name => "index_configuration_items_on_configuration_option_id"

  create_table "configuration_items_configuration_options", :id => false, :force => true do |t|
    t.integer "configuration_item_id"
    t.integer "configuration_option_id"
  end

  add_index "configuration_items_configuration_options", ["configuration_item_id"], :name => "conf_item_conf_opt_id_item_idx"
  add_index "configuration_items_configuration_options", ["configuration_option_id"], :name => "conf_item_conf_opt_id_opt_idx"

  create_table "configuration_options", :force => true do |t|
    t.string   "description"
    t.string   "internal_identifier"
    t.string   "value"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "user_defined",        :default => false
  end

  add_index "configuration_options", ["internal_identifier"], :name => "index_configuration_options_on_internal_identifier"
  add_index "configuration_options", ["user_defined"], :name => "index_configuration_options_on_user_defined"
  add_index "configuration_options", ["value"], :name => "index_configuration_options_on_value"

  create_table "configurations", :force => true do |t|
    t.string   "description"
    t.string   "internal_identifier"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_template",         :default => false
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

  create_table "content_versions", :force => true do |t|
    t.integer  "content_id"
    t.integer  "version"
    t.string   "title"
    t.string   "permalink"
    t.text     "excerpt_html"
    t.text     "body_html"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "internal_identifier"
    t.boolean  "display_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "versioned_type"
  end

  add_index "content_versions", ["content_id"], :name => "index_content_versions_on_content_id"

  create_table "contents", :force => true do |t|
    t.string   "type"
    t.string   "title"
    t.string   "permalink"
    t.text     "excerpt_html"
    t.text     "body_html"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "internal_identifier"
    t.boolean  "display_title"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["created_by_id"], :name => "index_contents_on_created_by_id"
  add_index "contents", ["internal_identifier"], :name => "contents_iid_idx"
  add_index "contents", ["permalink"], :name => "index_contents_on_permalink"
  add_index "contents", ["type"], :name => "index_contents_on_type"
  add_index "contents", ["updated_by_id"], :name => "index_contents_on_updated_by_id"
  add_index "contents", ["version"], :name => "index_contents_on_version"

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

  create_table "data_migrations", :id => false, :force => true do |t|
    t.string "version"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
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

  create_table "document_types", :force => true do |t|
    t.string   "external_identifier"
    t.string   "internal_identifier"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documented_items", :force => true do |t|
    t.string   "documented_klass"
    t.integer  "documented_content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "online_document_section_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "external_identifier"
    t.string   "internal_identifier"
    t.string   "description"
    t.integer  "document_record_id"
    t.string   "document_record_type"
    t.integer  "document_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["document_record_type", "document_record_id"], :name => "document_record_poly_idx"
  add_index "documents", ["document_type_id"], :name => "document_type_idx"

  create_table "dynamic_data", :force => true do |t|
    t.string   "reference_type"
    t.integer  "reference_id"
    t.text     "dynamic_attributes"
    t.integer  "created_with_form_id"
    t.integer  "updated_with_form_id"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dynamic_data", ["created_by_id"], :name => "index_dynamic_data_on_created_by_id"
  add_index "dynamic_data", ["created_with_form_id"], :name => "index_dynamic_data_on_created_with_form_id"
  add_index "dynamic_data", ["reference_id"], :name => "index_dynamic_data_on_reference_id"
  add_index "dynamic_data", ["reference_type"], :name => "index_dynamic_data_on_reference_type"
  add_index "dynamic_data", ["updated_by_id"], :name => "index_dynamic_data_on_updated_by_id"
  add_index "dynamic_data", ["updated_with_form_id"], :name => "index_dynamic_data_on_updated_with_form_id"

  create_table "dynamic_form_documents", :force => true do |t|
    t.integer  "dynamic_form_model_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dynamic_form_documents", ["dynamic_form_model_id"], :name => "index_dynamic_form_documents_on_dynamic_form_model_id"
  add_index "dynamic_form_documents", ["type"], :name => "index_dynamic_form_documents_on_type"

  create_table "dynamic_form_models", :force => true do |t|
    t.string   "model_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dynamic_forms", :force => true do |t|
    t.string   "description"
    t.text     "definition"
    t.integer  "dynamic_form_model_id"
    t.string   "model_name"
    t.string   "internal_identifier"
    t.boolean  "default"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dynamic_forms", ["created_by_id"], :name => "index_dynamic_forms_on_created_by_id"
  add_index "dynamic_forms", ["dynamic_form_model_id"], :name => "index_dynamic_forms_on_dynamic_form_model_id"
  add_index "dynamic_forms", ["internal_identifier"], :name => "index_dynamic_forms_on_internal_identifier"
  add_index "dynamic_forms", ["model_name"], :name => "index_dynamic_forms_on_model_name"
  add_index "dynamic_forms", ["updated_by_id"], :name => "index_dynamic_forms_on_updated_by_id"

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

  add_index "file_assets", ["file_asset_holder_id", "file_asset_holder_type"], :name => "file_asset_holder_idx"
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
    t.float    "amount"
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

  create_table "preference_options", :force => true do |t|
    t.string   "description"
    t.string   "internal_identifier"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preference_options_preference_types", :id => false, :force => true do |t|
    t.integer  "preference_type_id"
    t.integer  "preference_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preference_options_preference_types", ["preference_option_id"], :name => "pref_opt_pref_type_pref_opt_id_idx"
  add_index "preference_options_preference_types", ["preference_type_id"], :name => "pref_opt_pref_type_pref_type_id_idx"

  create_table "preference_types", :force => true do |t|
    t.string   "description"
    t.string   "internal_identifier"
    t.integer  "default_pref_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preference_types", ["default_pref_option_id"], :name => "index_preference_types_on_default_pref_option_id"

  create_table "preferences", :force => true do |t|
    t.integer  "preference_option_id"
    t.integer  "preference_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["preference_option_id"], :name => "index_preferences_on_preference_option_id"
  add_index "preferences", ["preference_type_id"], :name => "index_preferences_on_preference_type_id"

  create_table "published_elements", :force => true do |t|
    t.integer  "published_website_id"
    t.integer  "published_element_record_id"
    t.string   "published_element_record_type"
    t.integer  "version"
    t.integer  "published_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "published_elements", ["published_by_id"], :name => "index_published_elements_on_published_by_id"
  add_index "published_elements", ["published_element_record_id", "published_element_record_type"], :name => "published_elm_idx"
  add_index "published_elements", ["published_website_id"], :name => "index_published_elements_on_published_website_id"
  add_index "published_elements", ["version"], :name => "index_published_elements_on_version"

  create_table "published_websites", :force => true do |t|
    t.integer  "website_id"
    t.text     "comment"
    t.decimal  "version"
    t.boolean  "active"
    t.integer  "published_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "published_websites", ["active"], :name => "index_published_websites_on_active"
  add_index "published_websites", ["published_by_id"], :name => "index_published_websites_on_published_by_id"
  add_index "published_websites", ["version"], :name => "index_published_websites_on_version"
  add_index "published_websites", ["website_id"], :name => "index_published_websites_on_website_id"

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

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "taggable_poly_idx"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "themes", :force => true do |t|
    t.integer  "website_id"
    t.string   "name"
    t.string   "theme_id"
    t.string   "author"
    t.integer  "version"
    t.string   "homepage"
    t.text     "summary"
    t.integer  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "themes", ["active"], :name => "index_themes_on_active"
  add_index "themes", ["website_id"], :name => "index_themes_on_website_id"

  create_table "tree_menu_node_defs", :force => true do |t|
    t.string   "node_type"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "menu_short_name"
    t.string   "menu_description"
    t.string   "text"
    t.string   "icon_url"
    t.string   "target_url"
    t.string   "resource_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tree_menu_node_defs", ["parent_id"], :name => "index_tree_menu_node_defs_on_parent_id"

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "preference_id"
    t.integer  "preferenced_record_id"
    t.string   "preferenced_record_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_preferences", ["preference_id"], :name => "index_user_preferences_on_preference_id"
  add_index "user_preferences", ["preferenced_record_id"], :name => "index_user_preferences_on_preferenced_record_id"
  add_index "user_preferences", ["preferenced_record_type"], :name => "index_user_preferences_on_preferenced_record_type"
  add_index "user_preferences", ["user_id"], :name => "index_user_preferences_on_user_id"

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

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["last_logout_at", "last_activity_at"], :name => "activity_idx", :unique => true
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "valid_configurations", :force => true do |t|
    t.integer  "configured_item_id"
    t.string   "configured_item_type"
    t.integer  "configuration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "valid_configurations", ["configuration_id"], :name => "index_valid_configurations_on_configuration_id"
  add_index "valid_configurations", ["configured_item_id", "configured_item_type"], :name => "configured_item_poly_idx"

  create_table "valid_documents", :force => true do |t|
    t.integer "document_id"
    t.integer "documented_model_id"
    t.string  "documented_model_type"
  end

  add_index "valid_documents", ["document_id"], :name => "index_valid_documents_on_document_id"
  add_index "valid_documents", ["documented_model_id", "documented_model_type"], :name => "valid_documents_model_idx"

  create_table "valid_note_types", :force => true do |t|
    t.integer  "valid_note_type_record_id"
    t.string   "valid_note_type_record_type"
    t.integer  "note_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "valid_note_types", ["note_type_id"], :name => "index_valid_note_types_on_note_type_id"
  add_index "valid_note_types", ["valid_note_type_record_id", "valid_note_type_record_type"], :name => "valid_note_type_record_idx"

  create_table "valid_preference_types", :force => true do |t|
    t.integer "preference_type_id"
    t.integer "preferenced_record_id"
    t.string  "preferenced_record_type"
  end

  create_table "view_types", :force => true do |t|
    t.string   "internal_identifier"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "website_hosts", :force => true do |t|
    t.integer  "website_id"
    t.string   "host"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_hosts", ["website_id"], :name => "index_website_hosts_on_website_id"

  create_table "website_inquiries", :force => true do |t|
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_inquiries", ["website_id"], :name => "index_website_inquiries_on_website_id"

  create_table "website_nav_items", :force => true do |t|
    t.integer  "website_nav_id"
    t.string   "title"
    t.string   "url"
    t.integer  "position",            :default => 0
    t.integer  "linked_to_item_id"
    t.string   "linked_to_item_type"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_nav_items", ["lft"], :name => "index_website_nav_items_on_lft"
  add_index "website_nav_items", ["linked_to_item_id", "linked_to_item_type"], :name => "linked_to_idx"
  add_index "website_nav_items", ["parent_id"], :name => "index_website_nav_items_on_parent_id"
  add_index "website_nav_items", ["position"], :name => "index_website_nav_items_on_position"
  add_index "website_nav_items", ["rgt"], :name => "index_website_nav_items_on_rgt"
  add_index "website_nav_items", ["website_nav_id"], :name => "index_website_nav_items_on_website_nav_id"

  create_table "website_navs", :force => true do |t|
    t.integer  "website_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_navs", ["website_id"], :name => "index_website_navs_on_website_id"

  create_table "website_party_roles", :force => true do |t|
    t.integer  "website_id"
    t.integer  "role_type_id"
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_party_roles", ["party_id"], :name => "index_website_party_roles_on_party_id"
  add_index "website_party_roles", ["role_type_id"], :name => "index_website_party_roles_on_role_type_id"
  add_index "website_party_roles", ["website_id"], :name => "index_website_party_roles_on_website_id"

  create_table "website_section_contents", :force => true do |t|
    t.integer  "website_section_id"
    t.integer  "content_id"
    t.string   "content_area"
    t.integer  "position",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_section_contents", ["content_area"], :name => "index_website_section_contents_on_content_area"
  add_index "website_section_contents", ["content_id"], :name => "index_website_section_contents_on_content_id"
  add_index "website_section_contents", ["position"], :name => "index_website_section_contents_on_position"
  add_index "website_section_contents", ["website_section_id"], :name => "index_website_section_contents_on_website_section_id"

  create_table "website_section_versions", :force => true do |t|
    t.integer  "website_section_id"
    t.integer  "version"
    t.string   "title"
    t.integer  "website_id"
    t.string   "path"
    t.string   "permalink"
    t.text     "layout"
    t.boolean  "in_menu"
    t.integer  "position",            :default => 0
    t.string   "internal_identifier"
    t.boolean  "render_base_layout",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "versioned_type"
  end

  add_index "website_section_versions", ["website_section_id"], :name => "index_website_section_versions_on_website_section_id"

  create_table "website_sections", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "website_id"
    t.string   "path"
    t.string   "permalink"
    t.text     "layout"
    t.boolean  "in_menu"
    t.integer  "position",            :default => 0
    t.string   "internal_identifier"
    t.integer  "version"
    t.boolean  "render_base_layout",  :default => true
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_sections", ["internal_identifier"], :name => "section_iid_idx"
  add_index "website_sections", ["lft"], :name => "index_website_sections_on_lft"
  add_index "website_sections", ["parent_id"], :name => "index_website_sections_on_parent_id"
  add_index "website_sections", ["permalink"], :name => "index_website_sections_on_permalink"
  add_index "website_sections", ["position"], :name => "index_website_sections_on_position"
  add_index "website_sections", ["rgt"], :name => "index_website_sections_on_rgt"
  add_index "website_sections", ["version"], :name => "index_website_sections_on_version"
  add_index "website_sections", ["website_id"], :name => "index_website_sections_on_website_id"

  create_table "websites", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "subtitle"
    t.string   "internal_identifier"
    t.string   "email"
    t.boolean  "auto_activate_publication"
    t.boolean  "email_inquiries"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "widgets", :force => true do |t|
    t.string   "description"
    t.string   "internal_identifier"
    t.string   "icon"
    t.string   "xtype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_11_205135) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_or_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "building_id"
    t.string "Type"
    t.string "Status"
    t.date "CommissionDate"
    t.date "LastInspectionDate"
    t.string "OperationsCert"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "blazer_audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "building_id"
    t.string "InformationKey"
    t.string "Value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "FullNameOfBuildingAdmin"
    t.string "EmailOfAdminOfBuilding"
    t.integer "PhoneNumOfBuildingAdmin"
    t.string "FullNameOfTechContactForBuilding"
    t.string "TechContactEmailForBuilding"
    t.integer "TechContactPhoneForBuilding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "battery_id"
    t.string "Type"
    t.integer "NumOfFloorsServed"
    t.string "Status"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "user_id"
    t.string "CustomerCreationDate"
    t.string "date"
    t.string "CompanyName"
    t.string "CompanyHQAdress"
    t.string "FullNameOfCompanyContact"
    t.string "CompanyContactPhone"
    t.string "CompanyContactEMail"
    t.text "CompanyDesc"
    t.string "FullNameServiceTechAuth"
    t.string "TechAuthPhoneService"
    t.string "TechManagerEmailService"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "column_id"
    t.integer "SerialNumber"
    t.string "Model"
    t.string "Type"
    t.string "Status"
    t.date "CommisionDate"
    t.date "LastInspectionDate"
    t.string "InspectionCert"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "Full_name_of_the_contact"
    t.string "Bussiness_name"
    t.string "Email"
    t.string "Phone"
    t.string "Project_name"
    t.string "Project_description"
    t.string "Department_incharge"
    t.string "Message"
    t.binary "Attached_file", limit: 16777215
    t.datetime "Creation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "building_type"
    t.string "service_quality"
    t.string "number_of_apartments"
    t.string "number_of_floors"
    t.string "number_of_businesses"
    t.string "number_of_basements"
    t.string "number_of_parking"
    t.string "number_of_cages"
    t.string "number_of_occupants"
    t.string "number_of_hours"
    t.string "number_of_elevators_needed"
    t.string "price_per_unit"
    t.string "elevator_price"
    t.string "installation_fee"
    t.string "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "company_name"
    t.string "email"
    t.string "phone"
    t.string "department"
    t.string "project_name"
    t.string "project_description"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
end

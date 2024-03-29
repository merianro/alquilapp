# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_105223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "alquilers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "horas"
    t.bigint "user_id"
    t.bigint "car_id"
    t.integer "monto"
    t.datetime "end_date"
    t.integer "cantidad_ocupantes", default: 1
    t.boolean "activo", default: false
    t.index ["car_id"], name: "index_alquilers_on_car_id"
    t.index ["user_id"], name: "index_alquilers_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "marca"
    t.string "modelo"
    t.string "ano"
    t.string "color"
    t.string "transmision"
    t.integer "capacidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.point "ubication"
    t.boolean "disponible"
    t.float "porcentaje_combustible"
    t.string "tipo_de_combustible"
    t.string "patente"
    t.boolean "habilitado", default: true
  end

  create_table "estadisticas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mercado_pagos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sistema_reporte_id"
    t.index ["sistema_reporte_id"], name: "index_messages_on_sistema_reporte_id"
  end

  create_table "mp_webhooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accredited"
    t.string "id_pago"
  end

  create_table "parametros", force: :cascade do |t|
    t.integer "monto", default: 0
    t.string "nombre"
    t.integer "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sistema_reportes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "su_id"
    t.bigint "user_id"
    t.integer "severidad"
    t.text "descripcion"
    t.boolean "finalizado", default: false
    t.bigint "alquiler_id"
    t.integer "monto", default: 0
    t.index ["alquiler_id"], name: "index_sistema_reportes_on_alquiler_id"
    t.index ["user_id"], name: "index_sistema_reportes_on_user_id"
  end

  create_table "sus", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.integer "dni"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_sus_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sus_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dni"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "saldo", default: 0.0
    t.boolean "validado", default: false
    t.integer "role", default: 0
    t.bigint "phone"
    t.date "vencimiento_licencia"
    t.point "location_point"
    t.boolean "alquiler_activo", default: false
    t.boolean "banned", default: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "validar_mps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "validations", force: :cascade do |t|
    t.integer "su_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "description"
    t.boolean "borrado", default: false
    t.index ["user_id"], name: "index_validations_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

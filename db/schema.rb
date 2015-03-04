
ActiveRecord::Schema.define(version: 20150303214304) do

  create_table "songs", force: :cascade do |t|
    t.text     "title"
    t.text     "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

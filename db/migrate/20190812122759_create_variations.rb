class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations, id: false, force: :cascade do |t|
      t.integer "id",           limit: 8,    default: 0, null: false
      t.string  "typev",        limit: 255,              null: false
      t.string  "descriptionv", limit: 1024,             null: false
      t.integer "jobv",         limit: 8
      t.text    "objectid"
    end
  end
end


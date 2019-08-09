class CategoriesForLine < ActiveRecord::Migration
  def change
    create_table :categories_for_lines, id: false do |t|
      t.bigint :id, null: false, default: -> { "nextval('categories_for_line_id_seq'::regclass)" }
      t.primary_key :id
      t.string :name, :limit => 1024, null: false
    end
  end
end
class AddCategory < ActiveRecord::Migration
  def change
    change_table :lines do |t|
      t.belongs_to :categories_for_line, index: true
    end
  end
end

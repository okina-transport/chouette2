class AddCategoriesForLineFk < ActiveRecord::Migration
  def up
    add_foreign_key :lines, :categories_for_lines, name: 'line_categories_for_lines_fkey'
  end
  def down
    remove_foreign_key :access_points, name: :access_area_fkey
  end
end

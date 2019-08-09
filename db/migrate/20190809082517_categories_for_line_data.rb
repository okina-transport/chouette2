class CategoriesForLineData < ActiveRecord::Migration
  def up
    execute <<-SQL
      INSERT INTO categories_for_lines(name) VALUES('Défaut');
      INSERT INTO categories_for_lines(name) VALUES('IDFM');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM categories_for_lines;
    SQL
  end
end

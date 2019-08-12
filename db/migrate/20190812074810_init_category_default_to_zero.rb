class InitCategoryDefaultToZero < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE ONLY lines ALTER COLUMN categories_for_line_id SET DEFAULT 0;
      INSERT INTO categories_for_lines VALUES (0, 'Sans catégorie');
      UPDATE lines SET categories_for_line_id = 0 WHERE categories_for_line_id IS NULL;
    SQL
  end
end

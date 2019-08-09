class CategoriesForLineSequence < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE categories_for_line_id_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE categories_for_line_id_seq;
    SQL
  end
end

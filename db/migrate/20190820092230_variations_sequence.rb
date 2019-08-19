class VariationsSequence < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE variations_id_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE variations_id_seq;
    SQL
  end
end

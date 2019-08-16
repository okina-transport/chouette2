class UselessForGreatMigrationVersion < ActiveRecord::Migration
  def change
    execute <<-SQL
       SELECT * FROM time_table_periods
    SQL
  end
end

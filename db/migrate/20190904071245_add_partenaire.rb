class AddPartenaire < ActiveRecord::Migration
  def change
    add_column :lines, :partenaire, :string, :limit => 50
  end
end

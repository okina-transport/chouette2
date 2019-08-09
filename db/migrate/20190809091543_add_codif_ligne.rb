class AddCodifLigne < ActiveRecord::Migration
  def change
    add_column :lines, :codifligne, :string, :limit => 50
  end
end

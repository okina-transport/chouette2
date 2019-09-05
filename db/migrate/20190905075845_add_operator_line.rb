class AddOperatorLine < ActiveRecord::Migration
  def change
    add_column :lines, :operator, :string, :limit => 50
  end
end

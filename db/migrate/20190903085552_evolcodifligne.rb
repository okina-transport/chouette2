class Evolcodifligne < ActiveRecord::Migration
  def change
    add_column :lines, :codifligneCommercial, :string, :limit => 50
  end
end

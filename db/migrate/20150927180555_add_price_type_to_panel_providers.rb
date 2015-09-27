class AddPriceTypeToPanelProviders < ActiveRecord::Migration
  def change
    add_column :panel_providers, :price_type, :integer
    add_index :panel_providers, :price_type
  end
end

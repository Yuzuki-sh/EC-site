class RenamePriceIcludeTaxColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :price_iclude_tax, :price_include_tax
  end
end

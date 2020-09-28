class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id,           index: true
      t.integer :order_id           
      t.integer :price_iclude_tax
      t.integer :amount
      t.integer :work_status,       default: 0

      t.timestamps
    end
  end
end

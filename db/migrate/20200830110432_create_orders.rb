class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id,   null: false
      t.string :postcode,       null: false
      t.string :address,        null: false
      t.string :delivery_name,  null: false
      t.integer :postage,       null: false
      t.integer :total_fee,     null: false
      t.integer :payment,       null: false, default: 0
      t.integer :orders_status, null: false, default: 0

      t.timestamps
    end
  end
end

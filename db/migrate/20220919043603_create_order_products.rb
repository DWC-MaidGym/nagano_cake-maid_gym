class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :order_status
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end

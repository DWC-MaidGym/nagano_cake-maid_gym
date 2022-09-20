class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.boolean :is_deleted, default: false, null: false
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :password
      t.string :telephone_number
      t.string :post_code
      t.string :address

      t.timestamps
    end
  end
end

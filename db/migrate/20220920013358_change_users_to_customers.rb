class ChangeUsersToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :customers
  end
end

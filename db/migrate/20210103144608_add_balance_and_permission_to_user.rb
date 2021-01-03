class AddBalanceAndPermissionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :balance, :integer
    add_column :users, :permission, :string
  end
end

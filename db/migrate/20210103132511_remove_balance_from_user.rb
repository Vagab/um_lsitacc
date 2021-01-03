class RemoveBalanceFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :balance
  end
end

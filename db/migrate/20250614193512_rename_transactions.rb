class RenameTransactions < ActiveRecord::Migration[7.2]
  def change
    rename_table :transactions, :payments
    rename_column :registrations, :transaction_id, :payment_id
  end
end

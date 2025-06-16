class AddCcNumberToPayments < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :cc_number, :string, null: true
  end
end

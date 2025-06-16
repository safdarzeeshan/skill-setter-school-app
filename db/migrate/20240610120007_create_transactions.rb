class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.string :method, null: false
      t.references :license, foreign_key: true

      t.timestamps
    end
  end
end

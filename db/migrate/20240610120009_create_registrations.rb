class CreateRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.string :registrationable_type, null: false
      t.bigint :registrationable_id, null: false
      t.string :status, null: false
      t.references :transaction, foreign_key: true
      t.datetime :registered_at, null: false

      t.timestamps
    end

    add_index :registrations, [:registrationable_type, :registrationable_id]
  end
end

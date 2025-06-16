class CreateLicenses < ActiveRecord::Migration[7.2]
  def change
    create_table :licenses do |t|
      t.string :code, null: false
      t.references :term, null: false, foreign_key: true
      t.references :redeemed_by_student, foreign_key: { to_table: :students }
      t.datetime :redeemed_at

      t.timestamps
    end

    add_index :licenses, :code, unique: true
  end
end

class CreateTerms < ActiveRecord::Migration[7.2]
  def change
    create_table :terms do |t|
      t.references :school, null: false, foreign_key: true
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end

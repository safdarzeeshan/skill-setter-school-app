class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.references :school, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end

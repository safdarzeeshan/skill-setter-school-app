class CreateCourseTerms < ActiveRecord::Migration[7.2]
  def change
    create_table :course_terms do |t|
      t.references :course, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true

      t.timestamps
    end
  end
end

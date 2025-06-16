class AddUserToStudent < ActiveRecord::Migration[7.2]
  def change
    add_reference :students, :user, null: true, foreign_key: true
  end
end

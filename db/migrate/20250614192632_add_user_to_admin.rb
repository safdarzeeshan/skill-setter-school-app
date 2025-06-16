class AddUserToAdmin < ActiveRecord::Migration[7.2]
  def change
    add_reference :school_admins, :user, null: true, foreign_key: true
  end
end

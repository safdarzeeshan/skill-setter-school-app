class ChangeRegistrationStatusToActive < ActiveRecord::Migration[7.2]
  def change
    remove_column :registrations, :status, :string
    add_column :registrations, :active, :boolean, default: true, null: false
  end
end

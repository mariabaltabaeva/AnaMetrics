class AddUserToRegisteredApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :registered_applications, :user_id, :integer
    add_index :registered_applications, :user_id
  end
end

class RemoveUserIdFromSubmissions < ActiveRecord::Migration[5.2]
  def change
    remove_column :submissions, :user_id
  end
end

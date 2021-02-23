class AddCreatedAndUpdateTimeToCommentsAndUpdateTimeToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :created_at, :datetime
    add_column :comments, :updated_at, :datetime
    add_column :submissions, :updated_at, :datetime 
  end
end

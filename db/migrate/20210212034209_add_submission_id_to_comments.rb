class AddSubmissionIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :submission_id, :integer
    add_column :comments, :name, :string
  end
end

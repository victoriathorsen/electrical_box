class AddCommentsToStoriesOrOtherComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :comment_id
      t.string :comment_type
    end
  end
end

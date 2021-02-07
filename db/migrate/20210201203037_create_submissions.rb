class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :story
      t.datetime :created_at
      t.integer :user_id
    end
  end
end

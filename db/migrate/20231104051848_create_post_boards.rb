class CreatePostBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :post_boards do |t|
      t.integer :user_id, null: false
      t.integer :community_id, null: false
      t.integer :genre_id, null: false
      t.text :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end

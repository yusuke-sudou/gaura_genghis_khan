class CreatePostBoardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_board_comments do |t|
      t.integer :post_board_id, null: false
      t.integer :user_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end

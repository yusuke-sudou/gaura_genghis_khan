class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :menu_id, null: false
      t.text :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end

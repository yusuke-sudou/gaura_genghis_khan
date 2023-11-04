class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.integer :revier_id, null: false
      t.text :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.integer :admin_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end

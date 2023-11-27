class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :likes_counter, default: 0
      t.integer :comments_counter, default: 0
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end

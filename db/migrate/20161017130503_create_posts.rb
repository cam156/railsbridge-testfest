class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      # t.integer :user_id


      t.timestamps null: false
    end
  end
end

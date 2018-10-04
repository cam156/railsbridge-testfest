class ChangePostUseridToBeInt < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :content, :string
    change_column :posts, :user_id, :int
  end
end

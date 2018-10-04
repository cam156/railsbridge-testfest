class ChangeReplyUseridToBeInt < ActiveRecord::Migration[5.0]
  def change
    change_column :replies, :post_id, :int
    change_column :replies, :user_id, :int
  end
end

class Reply < ActiveRecord::Base
  validates :body, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  belongs_to :user
  belongs_to :post

 # def user_id
 #   return @user_id if @user_id.nil?
 #   @user_id.to_i
 # end

 # def post_id
 #   #return @post_id if @post_id.blank?
 #   @post_id.to_i
 # end
end

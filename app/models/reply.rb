class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates  :body, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  def post_id
    id = super
    return if id.nil?
    super.to_i
  end
end

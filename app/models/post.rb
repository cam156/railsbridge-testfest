class Post < ActiveRecord::Base
  validates :content, presence: true
  validates :user_id, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :replies
end

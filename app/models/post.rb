class Post < ActiveRecord::Base
  validates_presence_of :title
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
end

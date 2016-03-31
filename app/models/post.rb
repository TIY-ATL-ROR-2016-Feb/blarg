class Post < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  def tag_names
    self.tags.map { |tag| tag.name }.join(", ")
  end

  def tag_names=(new_tag_names)
    names = new_tag_names.split(", ")
    tags = names.map { |name| Tag.find_or_create_by(name: name) }
    self.tags = tags
  end
end

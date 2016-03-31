class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    Post.find_each do |post|
      post.update(user_id: 1)
    end
  end
end

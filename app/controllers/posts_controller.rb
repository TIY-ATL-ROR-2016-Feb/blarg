class PostsController < ApplicationController
  def index
    posts = Post.all
    render :index, locals: { posts: posts }
  end
end

class TagsController < ApplicationController
  def index
    @tag = Tag.find_by!(name: params["name"])
    @posts = @tag.posts
    render :index
  end
end

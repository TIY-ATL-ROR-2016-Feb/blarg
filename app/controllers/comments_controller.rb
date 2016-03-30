class CommentsController < ApplicationController
  # def create
  #   comment = Comment.create(post_id: params["id"],
  #                            body: params["body"])
  #   redirect_to post_path(params["id"])
  # end

  def create
    @post = Post.find(params["id"])
    @post.comments.create(body: params["body"])
    redirect_to post_path(@post)
  end
end

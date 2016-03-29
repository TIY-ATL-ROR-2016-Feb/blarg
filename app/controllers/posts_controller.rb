class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(title: params["title"],
                     content: params["content"])
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    post = Post.find(params["id"])
    render :edit, locals: { post: post }
  end

  def update
    post = Post.find(params["id"])
    post.update(title: params["title"],
                content: params["content"])
    redirect_to root_path
  end

  def destroy
    post = Post.find(params["id"])
    post.destroy
    redirect_to :root
  end

  def show
    @post = Post.find(params["id"])
    render :show
  end
end

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
    tag_names = params["tags"].split(", ")
    tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    @post = Post.new(title: params["title"],
                     tags: tags,
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
    # post.title = params["title"]
    # post.content = params["content"]
    # post.save
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

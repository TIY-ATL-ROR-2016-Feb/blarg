class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params["id"])
    render :show
  end

  def new
    authenticate!
    @post = Post.new
    render :new
#    redirect_to post_path(@post)
  end

  def create
    authenticate!
    @post = current_user.posts.new(title: params["title"],
                                   tag_names: params["tags"],
                                   content: params["content"])
    # @post = Post.new(title: params["title"],
    #                  tag_names: params["tags"],
    #                  user_id: current_user.id,
    #                  content: params["content"])
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  # def create
  #   tag_names = params["tags"].split(", ")
  #   tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
  #   @post = Post.new(title: params["title"],
  #                    tags: tags,
  #                    content: params["content"])
  #   if @post.save
  #     redirect_to :root
  #   else
  #     render :new
  #   end
  # end

  def edit
    authenticate!
    post = Post.find(params["id"])
    render :edit, locals: { post: post }
  end

  def update
    authenticate!
    post = Post.find(params["id"])
    post.update(title: params["title"],
                tag_names: params["tags"],
                content: params["content"])
    # post.title = params["title"]
    # post.content = params["content"]
    # post.save
    redirect_to root_path
  end

  def destroy
    authenticate!
    post = Post.find(params["id"])
    if current_user.id == post.user_id
      post.destroy
    else
      flash[:notice] = "You don't have permission to do that, asshole."
    end
    redirect_to :root
  end
end

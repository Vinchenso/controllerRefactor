class PostsController < ApplicationController

  def index
    load_posts
  end

  def show
    load_post
  end

  def new
    build_post
  end

  def edit
    load_post
  end

  def create
    build_post(post_params)
    save_post or render :new
  end

  def update
    load_post
    update_post or render :edit
  end

  def destroy
    load_post
    @post.destroy
    redirect_to posts_path
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :content)
  end

  def load_posts
    @posts = Post.all
  end

  def build_post(arg = nil)
    @post = Post.new(arg)
  end

  def save_post
    if @post.save
      redirect_to @post
    end
  end

  def update_post
    if  @post.update(post_params)
      redirect_to @post
    end
  end
end

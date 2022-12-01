class PostsController < ApplicationController
  
  before_action :find_user, only: [:index, :new, :create, :show]
  before_action :find_post, only: [:show, :edit, :update]
  
  def index
    @posts = Post.all
  end

  def new
    redirect_to new_login_path unless @user
    @post = Post.new
  end
  
  def create
    @new_post = Post.new(post_params)
    @new_post.user_id = @user.id 
    
    if @new_post.save
      flash[:notice] = "Post created"
      redirect_to posts_path
    else
      flash[:alert] = "Could not create post, please try again"
      render  :new, status: :unprocessable_entity
    end
    
  end

  def show
  end

  def edit
  end
  
  def update
    
    if @post.update(post_params)
      flash[:notice] = "Post updated!"
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
end

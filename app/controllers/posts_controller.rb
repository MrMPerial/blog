class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @post = user.posts.new(post_params)

    if @post.save
      redirect_to dashboards_path
    else
      flash[:alert] = "Post couldn't save!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find( params[:id] )
  end

  def update
    @post = Post.find( params[:id] )

    if @post.update(post_params)
      redirect_to dashboards_path
    else
      flash[:alert] = "Post couldn't save!"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find( params[:id] )
    user = Post.find( params[:id] ).user_id
    @user = User.find(user)
  end

  private
    def post_params
      params.require(:posts).permit(:title, :body)
    end
end

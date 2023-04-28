class DashboardsController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    redirect_to new_login_path unless @user

    if @user 
      @posts = User.find_by(id: session[:user_id]).posts.all
    end
  end
end

class SessionsController < ApplicationController
  def new
    authorize User
    redirect_to user_path(current_user) if logged_in?
    @user = User.new
    authorize @user
  end

  def create
    authorize User
    redirect_to user_path(current_user) if logged_in?
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      login(user)
      redirect_to user_path(user)
    else
      render 'static/home'
    end
  end

  def destroy
    log_out! if logged_in?
    redirect_to :root
  end
end

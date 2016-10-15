class UsersController < ApplicationController
  before_action :define_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def show
    authorize @user
  end

  def new
    authorize User
    @user = User.new
  end

  def create
    user = User.new(user_params)
    authorize user
    if user.save
      login(user)
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    authorize @user
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def define_user
    @user = User.find(params[:id])
  end
end

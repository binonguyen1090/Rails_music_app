class UsersController < ApplicationController
  before_action :require_sign_in!, only: [:show, :index]
  def index
    @users = User.all 
    @bands = Band.all
    render :index
  end


  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      redirect_to users_url
    else
      flash[:errors] = ["Cant sign up"]
      render new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  def user_params
    params.require(:user).permit(:username, :password)
    
  end
end

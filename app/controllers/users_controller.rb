class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def new
    @user = User.new()
  end

  def create
    # @user = User.new(username: params[:uname], email: params[:email], password: params[:pword])
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      flash[:success] = "User saved successfully."
      redirect_to new_user_path
    else
      flash.now[:error] = "User not saved. Please don't leave a field blank!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end

class UsersController < ApplicationController
  def show
  end

  def index
    @user = User.find(params[:id])
    @book = @user.book
    @newuser = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_show(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end

end

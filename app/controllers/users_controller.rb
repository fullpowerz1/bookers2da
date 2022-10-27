class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def index
    @user = current_user
    @newbook = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end

end

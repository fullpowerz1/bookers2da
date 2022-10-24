class BooksController < ApplicationController


  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

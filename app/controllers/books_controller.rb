class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end

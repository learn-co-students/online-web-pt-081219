class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @book.author = Author.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private

  def set_book
    unless @book = Book.find_by_id(params[:id])
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, author_attributes: [:name])
  end
end

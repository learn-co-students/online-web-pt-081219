# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_author, except: [:new, :create]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = @author.books
  end

  def new
    @book = Book.new
    if @author = Author.find_by_id(params[:author_id])
      @path = author_books_path(@author)
    else
      @author = Author.new
      @path = books_path
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to author_book_url(@author, @book)
    else
      render :new
    end
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to author_book_url(@author, @book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to author_books_url(@author)
  end

  private

  def set_author
    unless @author = Author.find_by_id(params[:author_id])
      redirect_to authors_path
    end
  end

  def set_book
    unless @book = Book.find_by_id(params[:id])
      redirect_to author_books(@author)
    end
  end

  def book_params
    params.require(:book).permit(:title, author_attributes: [:name, :id])
  end
end

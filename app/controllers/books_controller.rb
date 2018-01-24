class BooksController < ApplicationController
	before_action :set_book, only: [:show, :update, :destroy, :edit, :edit_description, :update_description]
  def new
  	@book = Book.new
  end

  def index
  	@books = Book.all
  end

  def edit
  end

  def create
  	# binding.pry
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to books_path
  	else
  		render 'new'
  	end
  end

  def show
  	# @book = Book.find(params[:id])
  end

  def update
  	# @book = Book.find(params[:id])
  	if @book.update_attributes(book_params)
  		redirect_to book_path(@book)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	# @book = Book.find(book_params)
  end

  # def edit_description
  # 	@book = Book.find(params[:id])
  # end

  def update_description
  	binding.pry
  	@book.update_column(:description, params[:book][:description])
  		redirect_to book_path(@book)
  end

  private

  def set_book
  	@book = Book.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:title, :description)
  end
end

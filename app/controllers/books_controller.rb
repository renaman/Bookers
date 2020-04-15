class BooksController < ApplicationController
	before_action :authenticate_user!
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end
	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end
	def show
		@book = Book.find(params[:id])
	end
	def update
	end
	def edit
		@book = User.find(params[:id])
		@book.save
		redirect_to books_path
	end
	def destroy
	end
	private
	def book_params
		params.require(:book).permit(:title, :opinion, :user_id)
	end

end

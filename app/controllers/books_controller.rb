class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :screen_book, only: [:update, :edit]

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
		    redirect_to book_path(@book)
		else
	       @books = Book.all
	       @user = current_user
           render "index"
	    end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@bookd = Book.find(params[:id])
		@book = Book.new
		@user = current_user
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   flash[:notice] = "You have updated book successfully."
		   redirect_to book_path(@book.id)
		 else
		 	render action: :edit
		 end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

	def screen_book
		book = Book.find(params[:id])
		if book.user != current_user
			redirect_to books_path
	    end
	end

end

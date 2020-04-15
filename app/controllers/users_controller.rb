class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@user = User.find(params[:id])
  	@books = @user.books
    @book = Book.new
  end
  def show
    @books = Book.all
    @user = User.find(params[:id])
    @book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
    @book = Book.find(params[:id])
  end
  def create
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to user_path
  end
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only:[:edit, :update]
  def index
  	@users = User.all
    @book = Book.new
    @user = current_user
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
    else
       render action: :show
    end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def screen_user
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user)
    end

  end
end

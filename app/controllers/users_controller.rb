class UsersController < ApplicationController
  def show
  	@user = user.find(params[:id])
  	@book = @user.book,page(params[:page]).reverse_order
  end
  def edit
  	@user = User.find(params[:id])
  end
end

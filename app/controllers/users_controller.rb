class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) #whitelists
    if @user.save
      flash[:success] = "Welcome to the Vinyl Swap Shop #{@user.username}" #confirms to user account creation
      redirect_to articles_path #redirects to articles listing
    else
      render 'new' #return to form if something wrong
    end
  end
  
  private 
  def user_params
    params.require(:user).permit(:username, :email, :location, :password) #allows entry to database
  end

end

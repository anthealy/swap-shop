class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show] # have @user ready for edit, show and update actions
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5 ) #will load 5 items per page
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) #whitelists
    if @user.save
      session[:user_id] = @user.id #auto logs in new user
      flash[:success] = "Welcome to the Vinyl Swap Shop #{@user.username}" #confirms to user account creation
      redirect_to user_path (@user) #redirects to user's profile.
    else
      render 'new' #return to form if something wrong
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params) #allows edit
      flash[:success] = "Your profile was updated successfully" #confirms update of profile
      redirect_to articles_path #return to vinyl listing
    else  #if edit does not work
      render 'edit' #return toedit page
    end
    
  end
      
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 2) #will load 5 items to user profile page
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User profile and all records for swap have been deleted"
    redirect_to users_path
  end
  
   private 
   
  def user_params
    params.require(:user).permit(:username, :email, :location, :password) #allows entry to database
  end
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
   if current_user != @user and !current_user.admin?  #if user is not current logged in user or admin
    flash[:danger] = "You can only edit your own account" #flash this message
    redirect_to root_path   #return to root
   end 
  end
  
  def require_admin
     if logged_in? and !current_user.admin? #if user is not current logged in user or admin
      flash[:danger] = "Only admin users can perfrom that action" #flash this message
      redirect_to root_path #return to root
     end
  end
  
end

  

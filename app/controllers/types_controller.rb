class TypesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  
  def index 
    @types = Type.paginate(page: params[:page], per_page: 5)
    
  end
  
  def new
    @type = Type.new
  end
  
  def create
    @type = Type.new(type_params)
    if @type.save
      flash[:success] = "Description tag was created successfully"
      redirect_to types_path
    else
      render 'new'
    end
  end

  
  def show
    @type = Type.find(params[:id])
    @type_articles = @type.articles.paginate(page: params[:page], per_page: 5)
  end
  
  private
    def type_params
    params.require(:type).permit(:name)
    end
    
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?) #you must be logged in, and an admin, to access the new and create actions
      flash[:danger] = "opps, you need to be an admin to do that"
      redirect_to types_path
    end
  end
end

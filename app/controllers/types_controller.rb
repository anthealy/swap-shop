class TypesController < ApplicationController
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
    
  end
  
  private
    def type_params
    params.require(:type).permit(:name)
    end

  
end

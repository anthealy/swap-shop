class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show] 
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5) #will load 5 items to page
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    
  end
  
  def create

    @article = Article.new(article_params)
    #temp, will be changed to point at logged in user later
    @article.user = User.first 
    if @article.save
     flash[:success] = "Article was successfully created"   
     redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    
    if @article.update(article_params)
      flash[:success] = "Item was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Item successfully deleted"
    redirect_to articles_path
  end
  
  
  private
   def set_article
     @article = Article.find(params[:id])
   end
  def article_params
    params.require(:article).permit(:artist, :album, :description)
  end
  
  def require_same_user
    if current_user != @article.user  #if the item does not belong to logged in user
      flash[:danger] = "Opps, that not your record" #show message
      redirect_to root_path  #return to root
    end
  end 
end
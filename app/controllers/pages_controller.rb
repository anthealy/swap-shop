class PagesController <ApplicationController
  
  def home
    redirect_to articles_path if logged_in? #go to listing if logged in, but sign in page if not. 
  end
  
  def about
    
  end
  
end

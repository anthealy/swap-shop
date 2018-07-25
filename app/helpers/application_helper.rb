module ApplicationHelper
  def gravatar_for(user) #defines the gravatar for method
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
  
  #def article_user(article)
    #user_logged_in? && current_user.id = article.user_id
  #end 
  
end

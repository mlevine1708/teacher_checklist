class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "teacherchecklist"
  end
  
  get '/' do
    if logged_in?
      redirect "/user/#{teacher.id}"
    else 
    erb :welcome
   end 
  end
  
  helpers do 
    
    def logged_in?
      #true if user is logged in, otherwise false 
      !!current_user
      #double bang (!!) 
    end
    
    #something wrong with this block 
    #def current_user
     # @current_user || = User.find_by(id: session[:user_id])
    #end
  end 
end


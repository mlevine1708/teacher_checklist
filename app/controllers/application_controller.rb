class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "teacherchecklist"
  end
  
  get '/' do
    if logged_in?
      redirect '/user'
    else 
      erb :welcome 
    end 
  end
  
  get '/user' do
    erb :user
  end
  
  helpers do 
    
    def logged_in?
      !!session[:user_id]
      #double bang (!!) 
    end
    
    
    def current_user
     @current_user ||=Users.find(session[:user_id])
    end
  end 
end


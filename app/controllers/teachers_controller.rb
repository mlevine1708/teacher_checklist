class UsersController < ApplicationController
  
  
  #the purpose of this route is to render the login page/form 
  get '/signup' do
    #erb (render) a view 
    if !logged_in?
    erb :signup 
    else
    redirect to '/login'
    end
  end 
  
  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      User.create(:username => params[:username], :password => params[:password])
      redirect '/login'
    end
  end 
  
  
  get '/login' do
    if !logged_in?
     erb :login 
    else 
      redirect to '/login'
    end
  end 
  
  post '/login' do
    @user = Users.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/login'
    end
    erb :user
  end
  
  
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
  
  
end
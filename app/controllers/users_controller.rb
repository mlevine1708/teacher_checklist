class UsersController < ApplicationController
  
  
  get '/signup' do
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
      Users.create(:username => params[:username], :password => params[:password])
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
      redirect to '/user'
    end
  end
  
  
  get '/logout' do
    if logged_in?
      @user = current_user
      @user = nil 
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
  
  
end
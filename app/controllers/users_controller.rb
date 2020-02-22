class UsersController < ApplicationController
  
  
  get '/signup' do
    if !session[:user_id]
      erb :'users/create'
    else
      redirect to ('/students')
    end 
  end 
  
  post '/signup' do 
    @user = Users.new(params)
    if !@user.save
      @errors = @user.errors.full_messages
      erb :'/users/create'
    else
      session[:user_id] = @user.id
      redirect to ('/welcome')
    end
  end 
  
  
  get '/login' do
    if !session[:user_id]
      erb :'/login'
    else
      redirect to '/students'
    end
  end 
  
  post '/login' do
    @user = Users.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/students/new'
    else
      @errors = "Invalid username or password."
      erb :'/login'
    end 
  end
  
  get '/users/show' do
    erb :'users/show'
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
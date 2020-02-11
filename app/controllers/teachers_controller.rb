class TeachersController < ApplicationController
  
  get '/login' do
    erb :login 
  end
  #the purpose of this route is to render the login page/form 
  
  
  post '/login' do
    #Find the user
    @teacher = Teachers.find_by(username: params[:username])
    #Authenticate the user - verify the user is who they say they are 
    if @teacher.authenticate(params[:password])
      
    #log the user in = create the user session 
    #redirect to the user's landing page
      session[:user_id] = @teachers 
      puts session 
      redirect "users/#{@teachers}"
      
    else 
      #tell the user they entered invalid credentials
      #redirect them to the login page 
    end 
  end
  #the purpose of this route is to receive the login form and sign the user in (create a session)
  
  #the job of signup is to render the sign up form 
  get '/signup' do
    #erb (render) a view 
    erb :signup 
  end
  
  get '/users/:id' do
    "this will be the user show route"
    
  end 
  
  post '/users' do 
    #here is where we will create a new user and persist the new user to the db 
  end 
  
  #params is a data hash 
end
class TeachersController < ApplicationController
  
  get '/login' do
    erb :login 
  end
  #the purpose of this route is to render the login page/form 
  
  
  post '/login' do
    #Find the user
    @teacher = Teacher.find_by(username: params[:username])
    #Authenticate the user - verify the user is who they say they are 
    #log the user in
    #redirect to the user's landing page
    
  end
  #the purpose of this route is to receive the login form and sign the user in (create a session)
  
  get '/signup' do
    
  end
  
end
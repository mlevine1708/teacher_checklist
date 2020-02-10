class TeachersController < ApplicationController
  
  get '/login' do
    erb :login 
  end
  #the purpose of this route is to render the login page/form 
  
  
  post '/login' do
    
    
  end
  #the purpose of this route is to receive the login form and sign the user in (create a session)
  
  get '/signup' do
    
  end
  
end
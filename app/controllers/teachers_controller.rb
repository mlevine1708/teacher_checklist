class TeachersController < ApplicationController
  
  get '/login' do
    erb :login 
  end
  #the purpose of this route is to render the login page/form 
  
  get '/signup' do
    
  end
  
end
class TeachersController < ApplicationController
  
  
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
      Teacher.create(:username => params[:username], :password => params[:password])
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
    @Teacher = Teacher.find_by(:username => params[:username])
    if @Teacher != nil && @teacher.password == params[:password]
      session[:user_id] = @teacher.id
      redirect to '/account'
    end
    erb :error
  end
      #tell the user they entered invalid credentials
      #redirect them to the login page 
    #end 
  #end
  #the purpose of this route is to receive the login form and sign the user in (create a session)
  
  #the job of signup is to render the sign up form 
  
  
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
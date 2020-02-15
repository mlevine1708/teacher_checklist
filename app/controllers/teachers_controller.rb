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
      @teacher = Teacher.create(:username => params[:username], :password => params[:password])
      @teacher.save
      session[:user_id] = @teacher.id
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
    #Find the user
   @teachers = User.find_by(:username => params[:username])
    #Authenticate the user - verify the user is who they say they are 
    if @teacher.authenticate(params[:password])
      
    #log the user in = create the user session 
    #redirect to the user's landing page
      session[:user_id] = @teacher.id
      redirect "users/#{@teacher}"
    else 
      redirect to '/signup'
    end
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
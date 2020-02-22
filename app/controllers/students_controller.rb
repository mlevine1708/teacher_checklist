class StudentsController < ApplicationController
  
  get '/students' do
    if logged_in?
      @student = current_user.student
      erb :'students/index'
    else 
      redirect to('/login')
    end
  end
  
  get '/students/new' do
    if logged_in?
      @current_user
    erb :'/students/new'
    else 
      redirect to('/login')
    end
  end 
  
   
  post '/students' do
    if logged_in?
      @student = Student.create(name: params[:name], grade_level: params[:grade_level], user_id: current_user.id)
      erb :'/students/new'
    else
      redirect '/students/index'
    end
  end
  
  
  
  get '/students/:id' do
    @student = Students.find(current_user.id)
    if logged_in? && @student.user == current_user
     erb :'/students/show'
    else 
     redirect '/login'  
    end
  end 
  
  get '/students/:id/edit' do
    @student = Student.find(params[:id])
    if logged_in? && @student.user == current_user
      @student = Students.find(params[:id])
      @user = User.find(session[:user_id])
      erb :'/students/edit'
    else 
      redirect to('/login')
    end
  end
  
  patch '/students/:id' do
    @student = Students.find(params[:id])
    @student.update(params[:student])
    
    if !params["name"]["grade_level"].empty?
      @student.user = User.create(name: params["student"]["grade_level"])
    end
    
    @student.save
    
    redirect to "students/#{@student.id}"
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


  


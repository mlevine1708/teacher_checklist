class StudentsController < ApplicationController
  #get student_entries/new to render a form to create new entry
  get '/students' do
    @students = Student.all
    erb :'/students/index'
  end
  
  get '/students/new' do
    if logged_in?
      @current_user
    erb :'/students/new'
    else 
      redirect '/login'
    end
  end 
  
   
  post '/students' do
    if logged_in?
      @student = current_user.students.build(params)
      erb :'/students/new'
    else
      redirect '/students/index'
    end
    @student.save
  end
  
  
  get '/students/:id' do
    @student = Student.find(params[:id])
    if logged_in? && @student.user == current_user
     erb :'/students/show'
    #else 
    # redirect '/login'  
    end
  end 
  
  get '/students/:id/edit' do
    @student = Student.find(params[:id])
    erb :'/students/edit'
  end
  
  patch '/students/:id' do
    @student = Student.find(params[:id])
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
     @current_user ||=User.find(session[:user_id])
    end
  end 
end


  


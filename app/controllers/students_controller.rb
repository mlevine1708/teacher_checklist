class StudentsController < ApplicationController
  #get student_entries/new to render a form to create new entry
  get '/students' do
    @students = Student.all
    erb :'/student_entries/index'
  end
  
  get '/students/new' do
    if logged_in?
      @current_user
    erb :'/student_entries/new'
    else 
      redirect '/login'
    end
  end 
  
   
  post '/students' do
    if logged_in?
      @student = current_user.students.build(params)
      erb :'/students/new'
    else
      redirect '/students'
    end
    @student.save
  end
  
  get '/students/:id' do
    @student = Student.find(params[:id])
    erb :'/students/show'
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
end

  


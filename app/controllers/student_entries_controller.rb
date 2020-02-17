class StudentEntriesController < ApplicationController
  #get student_entries/new to render a form to create new entry
  get '/student_entries' do
    @students = Student.all
    erb :'/student_entries/index'
  end
  
  get '/student_entries/new' do
    erb :'/student_entries/new'
  end 
  
   
  post '/student_entries' do
      @student = Student.create(params[:student])
   # if !params["name"]["grade_level"].empty?
    #  @student.user = User.create(name: params["name"]["grade_level"])
    #end
    
    @student.save
    
    redirect to "students/#{@student.id}"
  end
  
  get '/student_entries/id' do
    @student = Student.find(params[:id])
    erb :'/student_entries/show'
  end
  
  get '/student_entries/id/edit' do
    @student = Student.find(params[:id])
    erb :'/student_entries/edit'
  end
  
  patch '/student_entries/:id' do
    @student = Student.find(params[:id])
    @student.update(params[:student])
    
    if !params["name"]["grade_level"].empty?
      @student.user = User.create(name: params["student"]["grade_level"])
    end
    
    @student.save
    
    redirect to "students/#{@student.id}"
  end
end

  


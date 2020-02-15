class StudentEntriesController < ApplicationController
  #get student_entries/new to render a form to create new entry
  get '/student_entries/new' do
    erb :'/student_entries/new'
  end 
  #post student_entries to create new student entry, post should end in redirect, does not need a rendered page 
  post '/student_entries' do
    raise params.inspect
    if !logged_in?
      redirect '/'
    end
    
    if params[:content] != ""
      @student_entry = StudentEntry.create(content: params[:content], user_id: current_user.id)
      redirect "/student_entries/#{@student_entry.id)"
    else 
      redirect '/student_entries/new'
    end 
  end 
  #show page for student student_entries - don't think I need this
  
  #index route for all student_entries
  
end

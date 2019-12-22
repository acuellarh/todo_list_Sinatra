require 'sinatra'
require "make_todo"

get '/' do
  @tasks = Tarea.all #(:order => :created.desc)
  redirect '/new' if @tasks.empty?
  erb :index
end

get '/new/?' do
  @title = "Add todo item"
  erb :new
end

#complete task
post '/new/?' do
  Tarea.create("#{params[:content]}")  
  redirect '/'
end

#complete task
get '/:id/complete' do
  Tarea.update(params[:id])
  redirect '/'
end

#find task
get '/:id/delete' do
  @task = Tarea.find(params[:id]) 
  erb :delete
end

#delete task
delete '/:id' do
  Tarea.destroy(params[:id])
  redirect '/'
end


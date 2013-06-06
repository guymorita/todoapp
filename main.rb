require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'guymorita',
  :password => '',
  :database => 'todos',
  :encoding => 'utf8'
)

require_relative "todo"

get "/" do
  @todos = Todo.all
  erb :index
end

get "/new_todo" do
  erb :new_todo
end

post "/new_todo" do
  @todo = Todo.new(:name => params[:todo_name], :description => params[:todo_description], :owner => params[:todo_owner])
  if @todo.save
    redirect "/"
  else
    erb :new_todo
  end
end

get "/edit_todo/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  erb :edit_todo
end

post "/save_todo/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  if @todo.update_attributes(:name => params[:todo_name], :description => params[:todo_description], :owner => params[:todo_owner])
    redirect "/"
  else
    erb :edit_todo
  end
end

post "/toggle_todo/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  # binding.pry
  if @todo.status != true
    @todo.status = true
  else
    @todo.status = false
  end
  if @todo.save
    redirect "/"
  else
    erb :index
  end
end
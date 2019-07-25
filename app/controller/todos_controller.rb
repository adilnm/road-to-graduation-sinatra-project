class TodosController < ApplicationController

  get '/todos/new' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      @user=Helpers.current_user(session)
      erb :'/todos/new'
    end
  end

  post '/todos' do
    @user=Helpers.current_user(session)
    @todo=ToDo.create(user_id:@user.id, course_id: params[:courses])
    @todo.update(params[:todo])
    redirect '/courses'
  end

  get '/todos/:id/edit' do
    @user=User.find(session[:user_id])
    @todo = @user.to_dos.find_by_id(params[:id])
    erb :'/todos/edit'
  end

  patch '/todos/:id' do
     @todos = ToDo.find_by_id(params[:id])
     @todos.name = params[:name]
     @todos.category = params[:category]
     @todos.deadline = params[:deadline]
     @todos.description = params[:description]
     @todos.save
     redirect to "/courses"
  end

  delete '/todos/:id/delete' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end

    @todo = ToDo.find_by_id(params[:id])
    @todo.delete
    redirect to '/courses'
  end


end

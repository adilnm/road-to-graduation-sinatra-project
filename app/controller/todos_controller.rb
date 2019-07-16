class TodosController < ApplicationController
  get '/todos' do
    if Helpers.is_logged_in?(session)
      @todos=Helpers.current_user(session).to_dos
      @user=Helpers.current_user(session)
      erb :'/todos/todos'
    else
      redirect '/login'
    end
  end

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
    @todo=ToDo.find_or_create_by(user_id:@user.id, course_id: params[:courses])
    @todo.update(params[:todo])
  end
end

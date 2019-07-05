class TodosController < ApplicationController
  get '/todos' do
    if Helpers.is_logged_in?(session)
      @todos=Helpers.current_user(session).to_dos
      erb :'/todos/todos'
    else
      redirect '/login'
    end
  end

  get '/todos/new' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    else
      erb :'/todos/new'
  end
end

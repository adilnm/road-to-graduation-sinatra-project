class TodosController < ApplicationController

  get '/todos/new' do
    redirect_if_not_loged_in
      @user=Helpers.current_user(session)
      erb :'/todos/new'

  end

  post '/todos' do

    @user=Helpers.current_user(session)
        if !!params[:todo][:name]
          @todo=ToDo.create(user_id:@user.id, course_id: params[:courses])
          @todo.update(params[:todo])
        redirect '/courses'
        else
          redirect to '/todos/new'
        end
    end

  get '/todos/:id/edit' do

    @user=User.find(session[:user_id])
    @todo=@user.to_dos.find_by_id(params[:id])
    if @todo
      erb :'/todos/edit'
    else
      redirect to '/courses'
    end
  end

  patch '/todos/:id' do
    @user=User.find(session[:user_id])
    @todo=@user.to_dos.find_by_id(params[:id])
     if @todo

         @todo.name = params[:name]
         @todo.category = params[:category]
         @todo.deadline = params[:deadline]
         @todo.description = params[:description]
         @todo.save
         redirect to "/courses"

    else
      redirect to '/courses'
    end
  end

  delete '/todos/:id/delete' do
    redirect_if_not_loged_in
    @user=User.find(session[:user_id])
    @todo = @user.to_dos.find_by_id(params[:id])
    if @todo
      @todo.delete
    end
    redirect to '/courses'
  end


end

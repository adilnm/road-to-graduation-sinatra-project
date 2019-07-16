class CoursesController < ApplicationController
  get '/courses' do
    if Helpers.is_logged_in?(session)
      @user=Helpers.current_user(session)
      @courses=Helpers.current_user(session).courses
      erb :'/courses/courses'
    else
      redirect '/login'
    end
  end

  get '/courses/new' do
    if !Helpers.is_logged_in?(session)

      redirect '/login'

    else
      @user=Helpers.current_user(session)
      @courses=Helpers.current_user(session).courses
      erb :'/courses/new'

    end
  end

  post '/courses' do
    @user=User.find(session[:user_id])
    @user.courses << Course.create(params)
    redirect '/courses'
  end

  get '/courses/:id' do
    @course=Course.find(params[:id])

    erb :'/courses/show'
  end

end

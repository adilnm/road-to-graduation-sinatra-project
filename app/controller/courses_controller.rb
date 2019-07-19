class CoursesController < ApplicationController
      get '/courses' do
        if Helpers.is_logged_in?(session)
          @user=Helpers.current_user(session)
          @courses=Helpers.current_user(session).courses.uniq
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
        @user=User.find(session[:user_id])
        @course=Course.find(params[:id])

        erb :'/courses/show'
      end

      get '/courses/:id/edit' do
        @user=User.find(session[:user_id])
        @course = Course.find_by_id(params[:id])
        erb :'/courses/edit'
      end

      patch '/courses/:id' do
       @course = Course.find_by_id(params[:id])
       @course.name = params[:name]
       @course.professor = params[:professor]
       @course.final_grade = params[:grade]
       @course.save
       redirect to "/courses"
     end

    delete '/courses/:id/delete' do
      if !Helpers.is_logged_in?(session)
        redirect '/login'
      end

      @course = Course.find_by_id(params[:id])
      @course.delete
      redirect to '/courses'
    end


end

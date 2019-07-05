class UsersController < ApplicationController
  get '/signup' do
    if !Helpers.is_logged_in?(session)
      erb :'/users/signup'
    else
      redirect '/courses'
    end
  end

  post '/signup' do
    if params[:username]=="" || params[:email]=="" || params[:password]=="" || params[:name]==""
      redirect '/signup'
    else
      @user=User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
      session[:user_id]=@user.id
      redirect '/courses'
    end
  end

  get '/login' do
    if !Helpers.is_logged_in?(session)
      erb :'users/login'
    else
      redirect '/courses'
    end
  end

  post '/login' do
    @user=User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect '/courses'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.destroy
      redirect to '/login'
  else
    redirect to '/login'
    end
  end
end

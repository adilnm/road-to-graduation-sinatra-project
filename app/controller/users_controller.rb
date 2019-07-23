class UsersController < ApplicationController
  get '/signup' do
    if !Helpers.is_logged_in?(session)
      @errors=session[:errors]
      @errors ||=[]
      erb :'/users/signup'
    else
      redirect '/courses'
    end
  end

  post '/signup' do

    @user=User.new(params)
    @user.valid?

    if @user.errors.any?
      session[:errors] = @user.errors.messages.map {|k,v| "#{k} #{v.first}"}
      # flash[:message] = @user.errors.messages[:name]
      redirect '/signup'
    else
      @user.save
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
      flash[:errors] = "You have entered an invalid username and/or password"
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

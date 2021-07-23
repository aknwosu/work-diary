class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully Logged In!'
      redirect_to root_path, notice: "Successfully logged in"
    else
      flash[:warning] = 'Invalid Username or Password'
	  puts flash.inspect, 'flash==================='
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to root_path
  end
end

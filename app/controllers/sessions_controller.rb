class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email]).try(:authenticate, session_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Invalid email/password. Please try again."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

private

  def session_params
    params.require(:session).permit(:email, :password)
  end


end

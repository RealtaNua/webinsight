class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:email])
    if user and user.authenticate(params[:password])
      session[ :user_id ] = user.id

      redirect_to :controller => "dashboard"

    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    if session[ :user_id ]
     session[ :user_id ] = nil
     redirect_to :controller => "home", notice: "Logged Out" 
    else
     redirect_to login_url, notice: "Something is wrong. You are not logged in!"
    end
  end
end

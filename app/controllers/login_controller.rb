class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email].to_s)

    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to "/tasks"
    else
      flash.now.alert = 'Invalid e-mail or password.' #to render in the same action
      render :new
    end
  end
end

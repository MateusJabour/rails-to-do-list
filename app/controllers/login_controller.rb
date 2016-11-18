class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email].to_s)

    if user && user.authenticate(params[:password])
      return_url = session.fetch(:return_to, tasks_path)
      reset_session
      session[:user_id] = user.id
      redirect_to return_url
    else
      flash.now.alert = t('flash.login.create.alert') #to render in the same action
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: t('flash.login.destroy.notice')
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])  # user && user.authenticate(params[:session][:password]) と同等
      reset_session  # ログインの直前に必ずこれを書く
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])  # @user && @user.authenticate(params[:session][:password]) と同等
      if @user.activated?
        forwarding_url = session[:forwarding_url]
        reset_session  # ログインの直前に必ずこれを書く
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        log_in @user
        redirect_to forwarding_url || @user
      else
        message  = "Account not activated."
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other  # Turboを使用するときは，このステータスを指定する必要がある
  end
end

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = t "login.attr.message_success"
      redirect_to root_url
    else
      flash[:fails] = t "login.attr.fails"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t "login.attr.out_success"
    redirect_to root_url
  end
end

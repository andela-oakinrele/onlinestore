class SessionsController < ApplicationController
  layout "login"

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      # redirect_to roles_path
      if user.role_id == 3
        redirect_to stores_path
      else
        redirect_to roles_path
      end
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
   # User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def current_user
    User.find(session[:user_id])
  end
end


# module ApplicationHelper
#   def current_user
#     User.find(session[:current_user_id])
#   end
# end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Helpers are available to all views by default, but include this because
  # the Session Helper has to be available to the controller, too.
  include SessionsHelper
end

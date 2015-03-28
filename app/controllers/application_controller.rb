class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_filter :set_timezone

def after_sign_in_path_for(resource_or_scope)
  reservations_path# customize to your liking
end


 def set_timezone
   Time.zone = 'EST'
 end

  def access_denied(exception)
    redirect_to admin_organizations_path, :alert => exception.message
  end
end

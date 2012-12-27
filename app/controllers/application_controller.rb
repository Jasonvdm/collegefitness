class ApplicationController < ActionController::Base
  protect_from_forgery

  def general_error
    "You do not have permission to perform the requested action."
  end

  def error_404
    "The requested page could not be found"
  end

  def user_signed_in_filter?
    if !current_user
      flash[:error] = general_error
      redirect_to root_url
    end
  end

  def after_sign_in_path_for(resource)
	  if current_user.sign_in_count == 1
      ApplicationMailer.welcome_msg(current_user, "Welcome to CollegeStrong!", current_user.email).deliver
      edit_user_path(current_user)
    else
      workouts_path
    end
  end
end

class AdminController < ApplicationController
  before_filter :is_admin?
  
  def index
    @users = User.all
  end
  
  def is_admin?
    if current_user.nil? or !current_user.is_admin?
      flash[:error] = general_error
			redirect_to root_url
		end
  end
end

class HomeController < ApplicationController
	def index
		@user = User.new
	end


	def about
	end

	def contact
		begin
			if (params[:msg].blank?)
				render json: { error: true, msg: "Yikes! You forgot to add your comments." }
			else
				mail = ApplicationMailer.contact(params[:from], params[:msg])
				mail.deliver! unless request.host == 'localhost'
				render json: { error: false, msg: "Thanks for your feedback!" }
			end
		rescue
			render json: { error: true, msg: "There was a problem processing your feedback. Please try again" }
		end
	end
	
end

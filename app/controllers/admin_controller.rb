class AdminController < AuthorizationController
	def index
		@current_user ||= User.find(session[:user_id]) 
	end

end

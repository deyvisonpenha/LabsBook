class AuthorizationController < ApplicationController
	before_action :authorize
	
private

	def authorize
		if session[:user_id].nil?
			return redirect_to login_url, notice: "Você tentou um acesso sem permissao?"
		end

		user = User.find(session[:user_id])

		redirect_to login_url, notice: "Você tentou um acesso sem permissao?" if user.nil?
	end

end

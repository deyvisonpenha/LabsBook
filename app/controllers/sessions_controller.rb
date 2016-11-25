class SessionsController < ApplicationController
	#skip_before_action :authorize

	def new
	end

	def create
		user = Authenticator.authenticate(params[:name], params[:password])
		if !user.nil?
			session[:user_id] = user.id
			session[:user_name] = user.name
			redirect_to admin_url
		else 
			redirect_to login_url, alert:"Usuário ou Senha invalida"
		end
		
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_url, alert:"Successfully logged out"
	end
end

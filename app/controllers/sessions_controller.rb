class SessionsController < ApplicationController
	#skip_before_action :authorize 

	def new
	end

	def create
		user = Authenticator.authenticate(params[:name], params[:password])
		if !user.nil?
			session[:user_id] = user.id
			session[:user_name] = user.name
			redirect_to professor_path
		else 
			redirect_to root_path, alert:"Usuário ou Senha invalida"
		end
		
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, alert:"Successfully logged out"
	end
end

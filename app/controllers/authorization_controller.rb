class AuthorizationController < ApplicationController
	before_action :authorize 
	
private

	def authorize
		if session[:user_id].nil?
			return redirect_to aluno_url, notice: "Você tentou um acesso sem permissao?"
		end

		user = User.find(session[:user_id])

		redirect_to root_path, notice: "Você tentou um acesso sem permissao?" if user.nil?
	end

end

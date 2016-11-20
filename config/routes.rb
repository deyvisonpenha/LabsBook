Rails.application.routes.draw do
	
	#get 'aluno/index'

	#get 'admin/index'

	#get 'sessions/new'

	get 'sessions/create'

	get 'sessions/destroy'

	get 'aluno' => 'aluno#index'

	resources :users

	get 'admin' => 'admin#index'

	controller :sessions do
		get 'login' => :new
		post 'login' => :create
		delete 'logout' => :destroy
	end

	root 'admin#index'

end

Rails.application.routes.draw do

	#get 'aluno/index'

	#get 'admin/index'

	#get 'sessions/new'

	get 'sessions/create'

	get 'sessions/destroy'

	get 'reserva' => 'admin#new'
	get 'profile' => 'admin#profile'


	match "professor" => "admin#index", :as => "professor" , via: [:get, :post]
	match "aluno" => "aluno#index", via: :all
	
	resources :users
	resources :bookings, only: [:index, :show, :create , :new, :edit, :destroy]
	
	controller :aluno do
		get 'Lab1' => 'aluno#index'
		get 'Lab2' => 'aluno#index'
	end

	controller :sessions do
		get 'login' => :new
		post 'login' => :create
		delete 'logout' => :destroy
	end


	

	root 'aluno#index'

end

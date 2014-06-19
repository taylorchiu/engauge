Rails.application.routes.draw do
  root 'pages#index'
  resources :lessons, except: [:new, :edit]

  get 'engauge_templates/index', to: 'engauge_templates#index'

end

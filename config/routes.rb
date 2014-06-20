Rails.application.routes.draw do
  root 'pages#index'
  resources :lessons, except: [:new, :edit]

  get 'engauge_templates/index', to: 'engauge_templates#index'
  get 'engauge_templates/show', to: 'engauge_templates#show'

end

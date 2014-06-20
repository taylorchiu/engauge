Rails.application.routes.draw do
  root 'pages#index'
  resources :lessons, except: [:new, :edit]
  resources :students, except: [:new, :edit]

  get 'engauge_templates/index', to: 'engauge_templates#index'
  get 'engauge_templates/show', to: 'engauge_templates#show'
  get 'engauge_templates/student', to: 'engauge_templates#student'
end

#                   Prefix Verb   URI Pattern                          Controller#Action
#                      root GET    /                                    pages#index
#                   lessons GET    /lessons(.:format)                   lessons#index
#                           POST   /lessons(.:format)                   lessons#create
#                    lesson GET    /lessons/:id(.:format)               lessons#show
#                           PATCH  /lessons/:id(.:format)               lessons#update
#                           PUT    /lessons/:id(.:format)               lessons#update
#                           DELETE /lessons/:id(.:format)               lessons#destroy
#                  students GET    /students(.:format)                  students#index
#                           POST   /students(.:format)                  students#create
#                   student GET    /students/:id(.:format)              students#show
#                           PATCH  /students/:id(.:format)              students#update
#                           PUT    /students/:id(.:format)              students#update
#                           DELETE /students/:id(.:format)              students#destroy
#   engauge_templates_index GET    /engauge_templates/index(.:format)   engauge_templates#index
#    engauge_templates_show GET    /engauge_templates/show(.:format)    engauge_templates#show
# engauge_templates_student GET    /engauge_templates/student(.:format) engauge_templates#student


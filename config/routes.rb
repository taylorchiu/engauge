Rails.application.routes.draw do
 
	get 'static_pages/home', to: 'static_pages#home'
	get 'static_pages/home_template', to: 'static_pages#home_template'
 	
 	get '/users_templates/sign_up_form', to: 'users_templates#new'
  get '/sessions_templates/sign_in_form', to: 'sessions_templates#new', as: "sign_in_form"

  devise_for :users
  root 'pages#index'
  resources :lessons, except: [:new, :edit] do
  	resources :scores, except: [:show, :new, :edit]
  end
  
  get 'students/:url', to: 'scores#show', as: 'student_share_url'

  get 'engauge_templates/index', to: 'engauge_templates#index'
  get 'engauge_templates/show', to: 'engauge_templates#show'
  get 'engauge_templates/student', to: 'engauge_templates#student'
end



#                      Prefix Verb   URI Pattern                              Controller#Action
# users_templates_sign_up_form GET    /users_templates/sign_up_form(.:format)  users_templates#new
#             new_user_session GET    /users/sign_in(.:format)                 devise/sessions#new
#                 user_session POST   /users/sign_in(.:format)                 devise/sessions#create
#         destroy_user_session DELETE /users/sign_out(.:format)                devise/sessions#destroy
#                user_password POST   /users/password(.:format)                devise/passwords#create
#            new_user_password GET    /users/password/new(.:format)            devise/passwords#new
#           edit_user_password GET    /users/password/edit(.:format)           devise/passwords#edit
#                              PATCH  /users/password(.:format)                devise/passwords#update
#                              PUT    /users/password(.:format)                devise/passwords#update
#     cancel_user_registration GET    /users/cancel(.:format)                  devise/registrations#cancel
#            user_registration POST   /users(.:format)                         devise/registrations#create
#        new_user_registration GET    /users/sign_up(.:format)                 devise/registrations#new
#       edit_user_registration GET    /users/edit(.:format)                    devise/registrations#edit
#                              PATCH  /users(.:format)                         devise/registrations#update
#                              PUT    /users(.:format)                         devise/registrations#update
#                              DELETE /users(.:format)                         devise/registrations#destroy
#                         root GET    /                                        pages#index
#                lesson_scores GET    /lessons/:lesson_id/scores(.:format)     scores#index
#                              POST   /lessons/:lesson_id/scores(.:format)     scores#create
#                 lesson_score PATCH  /lessons/:lesson_id/scores/:id(.:format) scores#update
#                              PUT    /lessons/:lesson_id/scores/:id(.:format) scores#update
#                              DELETE /lessons/:lesson_id/scores/:id(.:format) scores#destroy
#                      lessons GET    /lessons(.:format)                       lessons#index
#                              POST   /lessons(.:format)                       lessons#create
#                       lesson GET    /lessons/:id(.:format)                   lessons#show
#                              PATCH  /lessons/:id(.:format)                   lessons#update
#                              PUT    /lessons/:id(.:format)                   lessons#update
#                              DELETE /lessons/:id(.:format)                   lessons#destroy
#            student_share_url GET    /students/:url(.:format)                 scores#show
#      engauge_templates_index GET    /engauge_templates/index(.:format)       engauge_templates#index
#       engauge_templates_show GET    /engauge_templates/show(.:format)        engauge_templates#show
#    engauge_templates_student GET    /engauge_templates/student(.:format)     engauge_templates#student

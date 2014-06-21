Rails.application.routes.draw do
  root 'pages#index'
  resources :lessons, except: [:new, :edit] do
  	resources :scores, except: [:show, :new, :edit]
  end
  
  get 'students/:url', to: 'scores#show', as: 'student_share_url'

  get 'engauge_templates/index', to: 'engauge_templates#index'
  get 'engauge_templates/show', to: 'engauge_templates#show'
  get 'engauge_templates/student', to: 'engauge_templates#student'
end



#                    Prefix Verb   URI Pattern                              Controller#Action
#                      root GET    /                                        pages#index
#             lesson_scores GET    /lessons/:lesson_id/scores(.:format)     scores#index
#                           POST   /lessons/:lesson_id/scores(.:format)     scores#create
#              lesson_score PATCH  /lessons/:lesson_id/scores/:id(.:format) scores#update
#                           PUT    /lessons/:lesson_id/scores/:id(.:format) scores#update
#                           DELETE /lessons/:lesson_id/scores/:id(.:format) scores#destroy
#                   lessons GET    /lessons(.:format)                       lessons#index
#                           POST   /lessons(.:format)                       lessons#create
#                    lesson GET    /lessons/:id(.:format)                   lessons#show
#                           PATCH  /lessons/:id(.:format)                   lessons#update
#                           PUT    /lessons/:id(.:format)                   lessons#update
#                           DELETE /lessons/:id(.:format)                   lessons#destroy
#         student_share_url GET    /students/:url(.:format)                 scores#show
#   engauge_templates_index GET    /engauge_templates/index(.:format)       engauge_templates#index
#    engauge_templates_show GET    /engauge_templates/show(.:format)        engauge_templates#show
# engauge_templates_student GET    /engauge_templates/student(.:format)     engauge_templates#student



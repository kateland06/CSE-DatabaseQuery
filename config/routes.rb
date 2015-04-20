Rails.application.routes.draw do
  resources :sections

  resources :class_sections

  resources :answers

  resources :slo_covered_by_kts

  resources :fulfills

  resources :program_of_studies

  resources :students

  resources :questions

  resources :student_learning_outcomes

  resources :program_educational_objectives

  resources :knowledge_topics
  
  resources :prerequisites

  get 'importing/index'
  get 'importing', to: 'importing#index'
  post 'importing/load', to: 'importing#load'
  post 'importing/loadQuiz', to: 'importing#loadQuiz'
  post 'importing/loadSloCoveredByKt', to: 'importing#loadSloCoveredByKt'
  post 'importing/loadSlo', to: 'importing#loadSlo'
  post 'importing/loadIRreport', to: 'importing#loadIRreport'

  
  get 'results/index'
  get 'results', to: 'results#index'
 
  get 'results/answers'
  get 'results/search', to: 'results#answers'
  post 'results/search', to: 'results#search'

  get 'results/abetReportYear'
  get 'results/abetReportYear', to: 'results#reportABETY'
  post 'results/abetReportYear', to: 'results#abetReportYear'
  
  get 'results/abetReportYearSemester'
  get 'results/abetReportYearSemester', to: 'results#reportABETYS'
  post 'results/abetReportYearSemester', to: 'results#abetReportYearSemester'
  
  get 'query', to: 'query#index'
  get 'query/index'
  get 'query/results', to: 'query#results'
  get 'query/search', to: 'query#search'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

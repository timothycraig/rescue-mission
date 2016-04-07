Rails.application.routes.draw do
  get '/', to: redirect('/questions')
  resources :questions do
    resources :answers, only: [:index, :new, :create, :destroy]
  end
end

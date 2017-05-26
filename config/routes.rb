Rails.application.routes.draw do

  resources :blogs, only: [:index, :new, :create, :edit, :update ,:destroy]do
    collection do
      post :confirm
    end
end
  resources :contacts, only: [:create, :new]do
   collection do
      post :confirm
    end
end

if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end

 root 'top#index'
end

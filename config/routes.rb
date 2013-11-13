ARtest::Application.routes.draw do
  scope :api do
    resources :articles, default: { format: :json}, except: [:new, :edit] do
      resources :comments, default: { format: :json}, except: [:new, :edit]
    end
  end

  # scope :admin do
  #   resources :something
  # end
  root 'site#index'
end

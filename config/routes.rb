ARtest::Application.routes.draw do
  
#scopes them to the api url prefix and makes nested routes for all 7 except new and edit.
# Makes the format only output json?

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

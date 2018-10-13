Rails.application.routes.draw do
  get 'home/index'
  get 'home/chatroom'
  get 'welcome/login'
  get 'welcome/signup'

  root 'welcome#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

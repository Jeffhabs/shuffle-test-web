Rails.application.routes.draw do
  root to: 'admin/questions#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

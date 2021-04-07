Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  resources :items #, only: [:new, :create, :show, :edit, :update, :destroy] 最終的に全て繋がったのでonly以降を消す
end

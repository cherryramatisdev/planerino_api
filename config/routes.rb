# frozen_string_literal: true

Rails.application.routes.draw do
  post 'auth/sign_in', to: 'auth#sign_in'
  post 'auth/sign_up', to: 'auth#sign_up'

  post 'year', to: 'year#create'
  get 'year', to: 'year#index'

  get 'month', to: 'month#index'

  post 'payer', to: 'payer#create'

  post 'debit', to: 'debit#create'
  get 'debit', to: 'debit#index'
end

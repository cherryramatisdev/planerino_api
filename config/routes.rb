# frozen_string_literal: true

Rails.application.routes.draw do
  post 'auth/sign_in', to: 'auth#sign_in'
  post 'auth/sign_up', to: 'auth#sign_up'
end

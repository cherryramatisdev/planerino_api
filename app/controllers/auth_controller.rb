# frozen_string_literal: true

require_relative '../actions/auth/sign_in'
require_relative '../actions/auth/sign_up'

class AuthController < ApplicationController
  def initialize
    super
    @sign_in_action = Actions::Auth::SignInAction.new
    @sign_up_action = Actions::Auth::SignUpAction.new
  end

  def sign_in
    status, error, user = @sign_in_action.call(email: params[:email], password: params[:password]).values_at(
      :status, :error, :user
    )

    return render json: { error: }, status: status unless error.nil?

    render json: user.to_json, status:
  end

  def sign_up
    status, error, user = @sign_up_action.call(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]).values_at(:status, :error, :user)

    return render json: { error: }, status: status unless error.nil?

    render json: user.to_json, status:
  end
end

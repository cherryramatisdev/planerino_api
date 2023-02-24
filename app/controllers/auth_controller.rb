# frozen_string_literal: true

require_relative '../actions/auth/sign_in'
require_relative '../actions/auth/sign_up'
require_relative '../actions/auth/handle_jwt'

class AuthController < ApplicationController
  def initialize
    super
    @sign_in_action = Actions::Auth::SignInAction.new
    @sign_up_action = Actions::Auth::SignUpAction.new
    @handle_jwt = Actions::Auth::HandleJwtAction.new
  end

  def sign_in
    status, error, user = @sign_in_action.call(email: params[:email], password: params[:password]).values_at(
      :status, :error, :user
    )

    return render json: { error: }, status: status unless error.nil?

    token = @handle_jwt.encode_user_email(user_email: user[:email])

    render json: { token: }, status:
  end

  def sign_up
    result = @sign_up_action.call(name: params[:name], email: params[:email], password: params[:password],
                                  password_confirmation: params[:password_confirmation])

    return render json: { error: result[:error] }, status: result[:status] unless result[:error].nil?

    render json: result[:user].to_json, status: result[:status]
  end
end

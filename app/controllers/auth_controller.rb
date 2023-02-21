# frozen_string_literal: true

require_relative '../actions/auth/sign_in'

class AuthController < ApplicationController
  def initialize
    super
    @sign_in_action = Actions::Auth::SignInAction.new
  end
  def sign_in
    status, error, user = @sign_in_action.call(email: params[:email], password: params[:password]).values_at(
      :status, :error, :user
    )

    return render json: { error: }, status: status unless error.nil?

    render json: user.to_json, status:
  end

  def sign_up; end
end

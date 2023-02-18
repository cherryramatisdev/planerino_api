# frozen_string_literal: true

require_relative '../actions/auth/sign_in'

class AuthController < ApplicationController
  def sign_in
    status, error, user = Actions::Auth::SignInAction.new.call(email: params[:email], password: params[:password]).values_at(
      :status, :error, :user
    )

    return render json: { error: }, status: status unless error.nil?

    render json: user.to_json, status:
  end

  def sign_up; end
end

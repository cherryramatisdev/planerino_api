# frozen_string_literal: true

require_relative '../actions/payer/create_payer'

class PayerController < ApplicationController
  def initialize
    super
    @create_payer_action = Actions::Payer::CreatePayer.new
  end

  def create
    result = @create_payer_action.call(name: params.permit(:name)[:name])

    return render json: { error: result[:error] }, status: result[:status] if result[:error]

    render json: result[:payer], status: result[:status]
  end
end

# frozen_string_literal: true

require_relative '../actions/debit/create_debit'

class DebitController < ApplicationController
  def initialize
    super
    @create_debit_action = Actions::Debit::CreateDebit.new
  end

  def create
    result = @create_debit_action.call(mount_debit_body(params_permit))

    return render json: { error: result[:error] }, status: result[:status] if result[:error]

    render json: result[:debit], status: result[:status]
  end

  private

  def mount_debit_body(data)
    paid = data[:paid] ||= false

    { title: data[:title], price: data[:price], paid:, payer_id: data[:payer_id], month_id: data[:month_id] }
  end

  def params_permit
    params.permit(:title, :price, :paid, :payer_id, :month_id)
  end
end

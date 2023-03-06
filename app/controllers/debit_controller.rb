# frozen_string_literal: true

require_relative '../actions/debit/create_debit'

class DebitController < ApplicationController
  def initialize
    super
    @create_debit_action = Actions::Debit::CreateDebit.new
  end

  def create
    p "t #{params.permit(:paid)}"
    paid = params.permit(:paid)[:paid] ||= false
    result = @create_debit_action.call(title: params.permit(:title)[:title], price: params.permit(:price)[:price],
                                       paid:, payer_id: params.permit(:payer_id)[:payer_id],
                                       month_id: params.permit(:month_id)[:month_id])

    return render json: { error: result[:error] }, status: result[:status] if result[:error]

    render json: result[:debit], status: result[:status]
  end
end

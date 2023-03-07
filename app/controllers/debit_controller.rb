# frozen_string_literal: true

require_relative '../actions/debit/create_debit'
require_relative '../actions/debit/list_debits_per_month'

class DebitController < ApplicationController
  def initialize
    super
    @create_debit_action = Actions::Debit::CreateDebit.new
    @list_debits_action = Actions::Debit::ListDebitsPerMonthAction.new
  end

  def index
    render json: @list_debits_action.call(month_id: params.permit(:month_id)[:month_id])
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

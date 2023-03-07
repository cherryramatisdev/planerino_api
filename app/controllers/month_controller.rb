# frozen_string_literal: true

require_relative '../actions/month/list_months_by_year'

class MonthController < ApplicationController
  def initialize
    super
    @list_months_by_year_action = Actions::Month::ListMonthsByYearAction.new
  end

  def index
    render json: @list_months_by_year_action.call(year_id: params.permit(:year_id)[:year_id])
  end
end

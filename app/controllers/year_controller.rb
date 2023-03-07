# frozen_string_literal: true

require_relative '../actions/year/create_year'
require_relative '../actions/year/create_months'
require_relative '../actions/year/list_years'
require_relative '../actions/auth/handle_jwt'

class YearController < ApplicationController
  def initialize
    super
    @create_year_action = Actions::Year::CreateYearAction.new
    @list_years_action = Actions::Year::ListYearsAction.new
    @create_months_in_year_action = Actions::Year::CreateMonthsAction.new
    @handle_jwt = Actions::Auth::HandleJwtAction.new
  end

  def index
    render json: @list_years_action.call
  end

  def create
    user = @handle_jwt.decode_into_user(token: request.headers['Authorization'])

    result = @create_year_action.call(name: params[:name], user:)

    return render json: { error: result[:error] }, status: result[:status] unless result[:error].nil?

    months_result = @create_months_in_year_action.call(year_id: result[:year][:id])

    unless months_result[:error].nil?
      return render json: { error: months_result[:error] },
                    status: months_result[:status]
    end

    render status: result[:status]
  end
end

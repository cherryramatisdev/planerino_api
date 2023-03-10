# frozen_string_literal: true

class MonthRepository
  # @param year Year
  def create_all_months_in_a_year(year:)
    # The first item in Date::MONTHNAMES array is nil
    # TODO: Support other languages
    month_names = Date::MONTHNAMES[1..]
    months = month_names.map { |m| { name: m } }

    year.month.insert_all(months)
  end

  def find_by_id(id:) = Month.find(id)
  def list_by_year(year_id:) = Month.where(year_id:)
end

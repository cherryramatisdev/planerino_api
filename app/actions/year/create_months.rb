# frozen_string_literal: true

module Actions
  module Year
    # CreateMonthsAction create the 12 month that belongs to year.
    class CreateMonthsAction
      def initialize(month_repository = MonthRepository.new, year_repository = YearRepository.new)
        @month_repository = month_repository
        @year_repository = year_repository
      end

      # @param year_id Integer
      def call(year_id:)
        year = @year_repository.find_by_id(id: year_id)

        return { status: 500, error: 'Internal server error' } if year.nil?

        bulk_insert_result = @month_repository.create_all_months_in_a_year(year:)

        return { status: 500, error: 'Internal server error' } if bulk_insert_result.nil?

        { status: 200, error: nil }
      end
    end
  end
end

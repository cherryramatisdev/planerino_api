# frozen_string_literal: true

module Actions
  module Month
    class ListMonthsByYearAction
      def initialize(month_repository = MonthRepository.new)
        @month_repository = month_repository
      end

      def call(year_id:)
        @month_repository.list_by_year(year_id:)
      end
    end
  end
end

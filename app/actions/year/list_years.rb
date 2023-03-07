# frozen_string_literal: true

module Actions
  module Year
    class ListYearsAction
      def initialize(year_repository = YearRepository.new)
        @year_repository = year_repository
      end

      def call
        @year_repository.list_all
      end
    end
  end
end

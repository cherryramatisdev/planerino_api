# frozen_string_literal: true

module Actions
  module Year
    class CreateYearAction
      def initialize(year_repository = YearRepository.new)
        @year_repository = year_repository
      end

      # @param name String
      # @param user User
      # @returns { status: Integer, error: String | NilClass }
      def call(name:, user:)
        return { status: 500, error: 'Internal server error' } if user.nil?

        year = @year_repository.create(name:, user:)

        return { status: 400, error: 'Provide correct body information with name' } if year.nil?

        { status: 204, error: nil, year: }
      end
    end
  end
end

# frozen_string_literal: true

module Actions
  module Debit
    class ListDebitsPerMonthAction
      def initialize(debit_repository = DebitRepository.new)
        @debit_repository = debit_repository
      end

      def call(month_id:)
        p "TESTE #{month_id}"
        @debit_repository.list_by_month(month_id:)
      end
    end
  end
end

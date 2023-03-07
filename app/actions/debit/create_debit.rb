# frozen_string_literal: true

module Actions
  module Debit
    class CreateDebit
      def initialize(debit_repository = DebitRepository.new, payer_repository = PayerRepository.new,
                     month_repository = MonthRepository.new)
        @debit_repository = debit_repository
        @payer_repository = payer_repository
        @month_repository = month_repository
      end

      # @param title String
      # @param price Float
      # @param paid Boolean
      # @param payer_id Integer
      # @param month_id Integer
      def call(title:, price:, paid:, payer_id:, month_id:)
        payer = @payer_repository.find_by_id(id: payer_id)
        month = @month_repository.find_by_id(id: month_id)
        result = @debit_repository.create(title:, price:, paid:, payer:, month:)

        return { status: 400, error: 'Provide correct body information' } if result.nil? || !result.valid?

        { status: 201, error: nil, debit: result }
      end
    end
  end
end

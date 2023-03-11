# frozen_string_literal: true

module Actions
  module Debit
    class CreateDebit
      def initialize(debit_repository = DebitRepository.new)
        @debit_repository = debit_repository
      end

      # @param title String
      # @param price Float
      # @param paid Boolean
      # @param payer_id Integer
      # @param month_id Integer
      def call(body)
        result = @debit_repository.create(title: body[:title], price: body[:price], paid: body[:paid], payer_id: body[:payer_id], month_id: body[:month_id])

        return { status: 400, error: 'Provide correct body information' } if result.nil? || !result.valid?

        { status: 201, error: nil, debit: result }
      end
    end
  end
end

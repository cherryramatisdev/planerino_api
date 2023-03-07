# frozen_string_literal: true

module Actions
  module Payer
    class CreatePayer
      def initialize(payer_repository = PayerRepository.new)
        @payer_repository = payer_repository
      end

      def call(name:)
        result = @payer_repository.create_or_find(name:)

        return { status: 400, error: 'Provide correct body information' } if result.nil? || !result.valid?

        { status: 201, error: nil, payer: result }
      end
    end
  end
end

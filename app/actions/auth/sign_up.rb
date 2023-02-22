# frozen_string_literal: true

module Actions
  module Auth
    class SignUpAction
      def initialize(user_repository = UserRepository.new)
        @repository = user_repository
      end

      def call(name:, email:, password:, password_confirmation:)
        user = @repository.create(name:, email:, password:, password_confirmation:)

        return { status: 400, error: 'Invalid information to create a new user' } if user.nil?

        { status: 200, error: nil, user: }
      end
    end
  end
end

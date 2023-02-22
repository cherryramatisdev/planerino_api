# frozen_string_literal: true

module Actions
  module Auth
    class SignInAction
      def initialize(user_repository = UserRepository.new)
        @repository = user_repository
      end

      def call(email:, password:)
        user = @repository.find_by_email(email)

        return { status: 400, error: 'Invalid email or password' } if user.nil?

        return { status: 200, error: nil, user: } if user.authenticate(password)

        { status: 400, error: 'Invalid email or password' }
      end
    end
  end
end

# frozen_string_literal: true

module Actions
  module Auth
    class SignInAction
      def call(email:, password:)
        user = User.find_by(email:)

        return { status: 400, error: 'Invalid email or password' } if user.nil?

        return { status: 200, error: nil, user: } if user.authenticate(password)

        { status: 400, error: 'Invalid email or password' }
      end
    end
  end
end

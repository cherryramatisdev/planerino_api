# frozen_string_literal: true

require 'jwt'

module Actions
  module Auth
    class HandleJwtAction
      def initialize(user_repository = UserRepository.new)
        @user_repository = user_repository
      end

      # @param user_email String
      # @return String
      def encode_user_email(user_email:)
        # TODO: maybe use HMAC for more security https://github.com/jwt/ruby-jwt
        JWT.encode({ email: user_email }, nil, 'none')
      end

      # @param token String
      # @return User | NilClass
      def decode_into_user(token:)
        decoded_token = JWT.decode(token, nil, false)
        user_email = decoded_token.first['email']

        @user_repository.find_by_email(email: user_email)
      end
    end
  end
end

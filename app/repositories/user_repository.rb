# frozen_string_literal: true
class UserRepository
  def find_by_email(email) = User.find_by(email:)

  def create(name:, email:, password:, password_confirmation:)
    user = User.create(name:, email:, password:, password_confirmation:)

    return nil unless user.valid?

    user
  end
end

# frozen_string_literal: true
class UserRepository
  def find_by_email(email) = User.find_by(email:)
end

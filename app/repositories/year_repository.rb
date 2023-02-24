# frozen_string_literal: true

class YearRepository
  # @param name String
  # @param user User
  def create(name:, user:)
    year = Year.create(name:, user:)

    return nil unless year.valid?

    year
  end

  # @param id Integer
  # @return Year | NilClass
  def find_by_id(id:) = Year.find_by(id:)
end

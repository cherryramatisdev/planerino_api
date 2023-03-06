# frozen_string_literal: true

class PayerRepository
  def create_or_find(name:) = Payer.find_or_create_by(name:)

  def find_by_id(id:) = Payer.find(id)
end

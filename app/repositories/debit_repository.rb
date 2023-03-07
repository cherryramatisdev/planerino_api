# frozen_string_literal: true

class DebitRepository
  # @param title String
  # @param price Float
  # @param paid Boolean
  # @param payer Payer
  # @param month Month
  def create(title:, price:, paid:, payer:, month:)
    debit = Debit.create(title:, price:, paid:, payer:, month:)

    return nil unless debit.valid?

    debit
  end

  def list_by_month(month_id:) = Debit.where(month_id:)
end

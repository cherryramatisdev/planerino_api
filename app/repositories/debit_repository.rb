# frozen_string_literal: true

class DebitRepository
  # @param title String
  # @param price Float
  # @param paid Boolean
  # @param payer Payer
  # @param month Month
  def create(title:, price:, paid:, payer_id:, month_id:)
    debit = Debit.create(title:, price:, paid:, payer_id:, month_id:)

    return nil unless debit.valid?

    debit
  end

  def list_by_month(month_id:) = Debit.where(month_id:)
end

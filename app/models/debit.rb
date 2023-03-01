# frozen_string_literal: true

class Debit < ApplicationRecord
  belongs_to :payer
  belongs_to :month

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end

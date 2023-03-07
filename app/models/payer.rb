# frozen_string_literal: true

class Payer < ApplicationRecord
  has_many :debit

  validates :name, presence: true
end

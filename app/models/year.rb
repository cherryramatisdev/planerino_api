# frozen_string_literal: true

class Year < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  has_many :month
end

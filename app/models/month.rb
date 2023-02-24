# frozen_string_literal: true

class Month < ApplicationRecord
  belongs_to :year
end

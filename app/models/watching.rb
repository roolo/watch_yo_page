# frozen_string_literal: true

# Model for watchings
class Watching < ApplicationRecord
  has_many :yusers, through: :watchings_yusers
  has_many :watchings_yusers

  validates :url, format: /\Ahttp/i, presence: true, uniqueness: true
end

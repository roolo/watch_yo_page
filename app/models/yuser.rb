# frozen_string_literal: true

# Model handling work with users from Yo service
class Yuser < ApplicationRecord
  has_many :watchings, through: :watchings_yusers
  has_many :watchings_yusers

  validates :username, presence: true
end

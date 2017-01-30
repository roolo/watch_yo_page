# frozen_string_literal: true

# Model for cross table between Watchings and Users
class WatchingsYuser < ApplicationRecord
  belongs_to :yuser
  belongs_to :watching
end

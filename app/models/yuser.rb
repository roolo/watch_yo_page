class Yuser < ApplicationRecord
  has_and_belongs_to_many :watchings
end

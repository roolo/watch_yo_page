class Yuser < ApplicationRecord
  has_and_belongs_to_many :watchings

  validates_presence_of :username
end

class Watching < ApplicationRecord
  has_and_belongs_to_many :yusers

  validates_presence_of :url
  validates_format_of   :url, with: /\Ahttp/i
end

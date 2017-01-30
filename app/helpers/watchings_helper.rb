# frozen_string_literal: true

# View helpers for Watchings controller
module WatchingsHelper
  def shorten_text text
    text = text.gsub %r{http(s)?:\/\/}i, ''
    truncate text, leght: 30, omission: '...'
  end
end

module WatchingsHelper
  def shorten_text text
    text = text.gsub /http(s)?:\/\//i, ''
    text = truncate text, leght: 30, omission: '...'

    text
  end
end

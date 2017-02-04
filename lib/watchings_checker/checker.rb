# frozen_string_literal: true
require 'open-uri'
require 'digest'

module WatchingChecker
  # Class checking for changes in subscribed pages
  class Checker
    def perform
      subscribed_watchings.each_with_object([]) do |watching, memo|
        current_hash = page_hash watching
        page_status = :same

        unless current_hash == watching.hash_sum
          notify_changed watching
          page_status = :changed
          watching.update hash_sum: current_hash
        end

        memo << { url: watching.url, status: page_status }
      end
    end

    def notify_changed(watching)
      watching.yusers.each do |yuser|
        YO.yo yuser.username,
              link: watching.url
      end
    end

    def subscribed_watchings
      Watching.includes(:yusers).where.not(yusers: { id: nil })
    end

    # @param [Watching] watching
    def page_hash watching
      page = Net::HTTP.get_response(URI.parse(watching.url))

      Digest::SHA256.hexdigest page.body
    end
  end
end

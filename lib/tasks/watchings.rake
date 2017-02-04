# frozen_string_literal: true
namespace :subscribed_watchings do
  desc 'Check watchings for changes'
  task check: :environment do
    require './lib/watchings_checker'

    checker = WatchingChecker::Checker.new
    puts checker.perform.inspect
  end
end

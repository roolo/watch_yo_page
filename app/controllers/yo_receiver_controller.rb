# frozen_string_literal: true

# Controller for handling the callbacks from Yo service
class YoReceiverController < ApplicationController
  def prepare
    the_wisdom = false

    the_wisdom = prepare_link(params[:username], params[:link]) if params[:link]

    render status: :ok if the_wisdom
  end

  # @todo Hash sign in url is not compared correctly
  def prepare_link(username, link)
    watching = Watching.joins(:yusers).find_by url: link, yusers: { username: username }

    link_params = { username: username, link: URI.encode(link), only_path: false }

    yo_link = if watching.nil?
                new_watching_url link_params
              else
                stop_watching_query_watching_url link_params.merge(id: watching.id)
              end

    YO.yo username,
          link: yo_link
  end

  # This action is visited on first Yo from Yuser
  def subscribed; end
end

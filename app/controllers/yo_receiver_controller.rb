class YoReceiverController < ApplicationController
  def prepare
    the_wisdom = false

    the_wisdom = prepare_link(params[:username], params[:link]) if params[:link]

    if the_wisdom
      render status: :ok
    end
  end

  def prepare_link(username, link)
    watching = Watching.joins(:yusers).find_by url: link, yusers: { username: username }

    link_params = {
      username:   username,
      link:       URI.encode(link),
      only_path:  false
    }

    if watching.nil?
      yo_link = new_watching_url link_params
    else
      yo_link = stop_watching_query_watching_url link_params
    end

    YO.yo username,
          link: yo_link
  end

  # This action is visited on first Yo from Yuser
  def subscribed
  end
end

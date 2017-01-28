class YoReceiverController < ApplicationController
  def prepare
    the_wisdom = false

    the_wisdom = prepare_link(params[:username], params[:link]) if params[:link]

    if the_wisdom
      render status: :ok
    end
  end

  def prepare_link(username, link)
    watching = Watching.find_by url: link

    if watching.nil?
      YO.yo username,
            link: new_watching_url(username: username, link: URI.encode(link), only_path: false)
    else
      'destroy_query_path'
    end

  end

  # This action is visited on first Yo from Yuser
  def subscribed
    Yuser.find_or_create_by username: params[:username]
  end
end

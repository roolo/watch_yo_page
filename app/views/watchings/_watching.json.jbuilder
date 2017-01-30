# frozen_string_literal: true
json.extract! watching, :id, :url, :created_at, :updated_at
json.url watching_url(watching, format: :json)

# frozen_string_literal: true
require 'webmock/rspec'

RSpec.configure do |config|
  config.before :each do
    stub_request(:post, 'http://api.justyo.co/yo/')
      .with(
        body: { 'api_token' => '54cd397f-e80f-46ac-8323-e8351b3dcdd8',
                'link' => 'http://test.host/watchings/new?link=https%3A%2F%2Fwww.paralelnipolis.cz%2Fprogram%2Ftranshumanismus%2F&username=LIPOQIL',
                'username' => 'LIPOQIL' },
        headers: { 'Accept' => '*/*',
                   'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                   'Content-Type' => 'application/x-www-form-urlencoded',
                   'User-Agent' => 'Faraday v0.9.2' }
      )
      .to_return(
        status: 200,
        body: '{"success": true, "yo_id": "55135e09f663d1000aed924c"}',
        headers: {}
      )
  end
end

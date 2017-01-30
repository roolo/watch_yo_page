# frozen_string_literal: true
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WatchingsHelper.
RSpec.describe WatchingsHelper, type: :helper do
  describe '#shorten_text' do
    let(:shortened_text) do
      shorten_text(
        'HTTP://MAILO.SVETEL.CZ/blog/learning-tips/how-to-be-a-better-writer--cut-out-the-sludge?trk=li_google_corp_' \
        'Learning'
      )
    end

    it 'leaves some text' do
      expect(shortened_text).not_to be_empty
    end

    it 'removes scheme' do
      expect(shortened_text).not_to match(/^http/i)
    end

    it 'adds tripledot for long text' do
      expect(shortened_text).to end_with '...'
    end

    it 'actually shortens url :)' do
      expect(shortened_text.length).to be <= 30
    end
  end
end

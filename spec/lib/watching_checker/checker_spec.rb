# frozen_string_literal: true
require 'rails_helper'
require './lib/watchings_checker'

describe WatchingChecker::Checker do
  describe '#page_hash' do
    let(:method_result) { subject.page_hash FactoryGirl.create(:watching) }

    it 'returns only subscribed watchings' do
      expect(method_result).to eq 'a63bc50fa08907f2be03a1f02a731334a4768012ed9b48101f9d336c6e8f7b9c'
    end
  end

  describe '#perform' do
    let(:method_result) { subject.perform }

    it 'returns only subscribed watchings' do
      expect(method_result).not_to be_nil
    end
  end

  describe '#subscribed_watchings' do
    let(:method_result) { subject.subscribed_watchings }

    it 'returns only subscribed watchings' do
      FactoryGirl.create :watching
      FactoryGirl.create :watching, :with_subscription

      expect(method_result.count).to eq 1
    end

    it 'returns subscribed Watchings' do
      FactoryGirl.create :watching
      the_watchings_ids = [
        FactoryGirl.create(:watching, :with_subscription).id,
        FactoryGirl.create(:watching, :with_subscription).id
      ]

      expect(method_result.map(&:id)).to eq the_watchings_ids
    end
  end
end

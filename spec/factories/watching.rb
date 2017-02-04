# frozen_string_literal: true
FactoryGirl.define do
  factory :watching do
    sequence :url do |n|
      format 'https://m.novinky.cz/articleDetails?aId=42744%d&sId&mId',
             n
    end

    trait :with_subscription do
      yusers { [FactoryGirl.create(:yuser)] }
    end
  end
end

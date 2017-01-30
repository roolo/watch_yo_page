# frozen_string_literal: true
FactoryGirl.define do
  factory :watching do
    sequence :url do |n|
      format 'HTTP://MAILO.SVETEL.CZ/blog/learning-tips/%s/how-to-be-a-better-writer--cut-out-the-sludge?trk='\
              'li_google_corp_Learning',
             n.to_s
    end
  end
end

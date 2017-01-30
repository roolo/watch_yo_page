# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'watchings/index', type: :view do
  before(:each) do
    assign(:watchings, [
             Watching.create!(FactoryGirl.attributes_for(:watching)),
             Watching.create!(FactoryGirl.attributes_for(:watching))
           ])
  end

  it 'renders a list of watchings' do
    render
    assert_select 'ul#watchings-list>li.watchings-item', count: 2
  end
end

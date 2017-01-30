# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'watchings/new', type: :view do
  let(:watching) { Watching.new(FactoryGirl.attributes_for(:watching)) }

  before(:each) do
    assign(:watching, watching)
    assign(:current_user, FactoryGirl.create(:yuser))
  end

  it 'renders new watching form' do
    render
    assert_select 'li', text: 'MAILO.SVETEL.CZ/blog/learni...'
  end
end

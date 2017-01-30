# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'watchings/show', type: :view do
  before(:each) do
    @watching = assign(:watching, FactoryGirl.create(:watching))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include @watching.url
  end
end

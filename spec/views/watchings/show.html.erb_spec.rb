require 'rails_helper'

RSpec.describe "watchings/show", type: :view do
  before(:each) do
    @watching = assign(:watching, Watching.create!(
      :url => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end

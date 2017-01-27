require 'rails_helper'

RSpec.describe "watchings/index", type: :view do
  before(:each) do
    assign(:watchings, [
      Watching.create!(
        :url => "MyText"
      ),
      Watching.create!(
        :url => "MyText"
      )
    ])
  end

  it "renders a list of watchings" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

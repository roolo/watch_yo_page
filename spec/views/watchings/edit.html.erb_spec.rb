require 'rails_helper'

RSpec.describe "watchings/edit", type: :view do
  before(:each) do
    @watching = assign(:watching, Watching.create!(
      :url => "MyText"
    ))
  end

  it "renders the edit watching form" do
    render

    assert_select "form[action=?][method=?]", watching_path(@watching), "post" do

      assert_select "textarea#watching_url[name=?]", "watching[url]"
    end
  end
end

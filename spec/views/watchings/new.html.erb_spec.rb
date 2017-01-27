require 'rails_helper'

RSpec.describe "watchings/new", type: :view do
  before(:each) do
    assign(:watching, Watching.new(
      :url => "MyText"
    ))
  end

  it "renders new watching form" do
    render

    assert_select "form[action=?][method=?]", watchings_path, "post" do

      assert_select "textarea#watching_url[name=?]", "watching[url]"
    end
  end
end

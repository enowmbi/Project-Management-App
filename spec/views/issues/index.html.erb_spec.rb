require 'rails_helper'

RSpec.describe "issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        :title => "Title",
        :description => "MyText",
        :severity => "Severity",
        :status => "Status"
      ),
      Issue.create!(
        :title => "Title",
        :description => "MyText",
        :severity => "Severity",
        :status => "Status"
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Severity".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "assignments/index", type: :view do
  before(:each) do
    assign(:assignments, [
      Assignment.create!(
        :user => nil,
        :project => nil,
        :status => "Status"
      ),
      Assignment.create!(
        :user => nil,
        :project => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of assignments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end

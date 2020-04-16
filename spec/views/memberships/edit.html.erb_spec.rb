require 'rails_helper'

RSpec.describe "memberships/edit", type: :view do
  before(:each) do
    @membership = assign(:membership, Membership.create!(
      user: nil,
      team: nil,
      owner: false
    ))
  end

  it "renders the edit membership form" do
    render

    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do

      assert_select "input[name=?]", "membership[user_id]"

      assert_select "input[name=?]", "membership[team_id]"

      assert_select "input[name=?]", "membership[owner]"
    end
  end
end

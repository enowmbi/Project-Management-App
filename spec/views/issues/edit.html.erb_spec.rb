require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :title => "MyString",
      :description => "MyText",
      :severity => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "input[name=?]", "issue[title]"

      assert_select "textarea[name=?]", "issue[description]"

      assert_select "input[name=?]", "issue[severity]"

      assert_select "input[name=?]", "issue[status]"
    end
  end
end

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it "should have a valid factory" do
    assignment = FactoryBot.build(:assignment)
    expect(assignment).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of user" do
      assignment = FactoryBot.build(:assignment, user: nil)
      expect(assignment).not_to be_valid
      expect(assignment.errors[:user]).to be_present
    end

  end

  describe "Associations" do

    it "should belong to a user" do
      user = FactoryBot.create(:user)
      assignment = FactoryBot.build(:assignment, user: user)
      expect(assignment.user).to eq user
    end

    it "should belong to a issue" do
      issue = FactoryBot.create(:issue)
      assignment = FactoryBot.build(:assignment, issue: issue)
      expect(assignment.issue).to eq issue
    end

  end




  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end

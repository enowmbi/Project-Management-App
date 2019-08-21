require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a valid factory" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of email" do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to be_present
    end

    it "should ensure the uniqueness of email" do
      user = FactoryBot.create(:user)

      new_user = FactoryBot.build(:user, email: user.email)

      expect(new_user).not_to be_valid
      expect(new_user.errors[:email]).to be_present
    end

  end

  describe "Associations" do

    it "should allow multiple assignments" do
      user = FactoryBot.create(:user)

      3.times.each do |n|
        assignment = FactoryBot.create(:assignment)
        user.assignments << assignment
        user_assignments = user.assignments
        expect(user_assignments.count).to eq n.next
        expect(user_assignments).to include assignment
      end
    end


    it "should allow multiple issues" do
      user = FactoryBot.create(:user)

      3.times.each do |n|
        issue = FactoryBot.create(:issue)
        user.issues << issue
        user_issues = user.issues
        expect(user_issues.count).to eq n.next
        expect(user_issues).to include issue
      end
    end


  end

  describe "Graceful Destroyal" do

    it "should destroy the associated assignments when deleted" do
      user = FactoryBot.create(:user)
      user.assignments.create(FactoryBot.attributes_for(:assignment))

      expect{ user.destroy }.to change(Assignment, :count).by(-1)
    end

  end


  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end

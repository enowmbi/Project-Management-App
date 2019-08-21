require 'rails_helper'

RSpec.describe Issue, type: :model do
  it "should have a valid factory" do
    issue = FactoryBot.build(:issue)
    expect(issue).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of project" do
      issue = FactoryBot.build(:issue, project: nil)
      expect(issue).not_to be_valid
      expect(issue.errors[:project]).to be_present
    end

    it "should ensure the presence of title " do 
      issue = FactoryBot.build(:issue,title: nil)    
      expect(issue).not_to be_valid
      expect(issue.errors[:title]).to be_present
    end

    it "should ensure uniqueness of title within project" do 
      project = FactoryBot.create(:project)
      issue = FactoryBot.create(:issue,project: project)      
      issue = FactoryBot.build(:issue,title: issue.title,project: project)
      expect(issue).not_to be_valid
      expect(issue.errors[:title]).to be_present
    end

    it "should ensure the presence of description" do 
      issue = FactoryBot.build(:issue,description: nil)
      expect(issue).not_to be_valid
      expect(issue.errors[:description]).to be_present
    end

    it "should ensure the presence of severity" do 
      issue = FactoryBot.build(:issue,severity: nil)
      expect(issue).not_to be_valid
      expect(issue.errors[:severity]).to be_present
    end

    it "should ensure the presence of status" do 
       issue = FactoryBot.build(:issue,status: nil)
       expect(issue).not_to be_valid
       expect(issue.errors[:status]).to be_present
    end

  end


  describe "Associations" do

    it "should belong to a project" do
      project = FactoryBot.create(:project)
      issue = FactoryBot.build(:issue, project: project)
      expect(issue.project).to eq project
    end

    it "should allow multiple assignments" do
      issue = FactoryBot.create(:issue)

      3.times.each do |n|
        assignment = FactoryBot.create(:assignment)
        issue.assignments << assignment
        issue_assignments = issue.assignments
        expect(issue_assignments.count).to eq n.next
        expect(issue_assignments).to include assignment
      end
    end


    it "should allow multiple users" do
      issue = FactoryBot.create(:issue)

      3.times.each do |n|
        user = FactoryBot.create(:user)
        issue.users << user
        issue_users = issue.users
        expect(issue_users.count).to eq n.next
        expect(issue_users).to include user
      end
    end

  end

  describe "Graceful Destroyal" do

    it "should destroy the associated assignments when deleted" do
      issue = FactoryBot.create(:issue)
      issue.assignments.create(FactoryBot.attributes_for(:assignment))

      expect{ issue.destroy }.to change(Assignment, :count).by(-1)
    end

  end


  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end

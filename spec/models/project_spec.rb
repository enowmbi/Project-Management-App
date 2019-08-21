require 'rails_helper'

RSpec.describe Project, type: :model do
  it "should have a valid factory" do
    project = FactoryBot.build(:project)
    expect(project).to be_valid
  end

  describe "Validators" do
    
    it "should ensure the presence of name" do
      project = FactoryBot.build(:project, name: nil)
      expect(project).not_to be_valid
      expect(project.errors[:name]).to be_present
    end
  
    
    it "should ensure the uniqueness of name" do
      project = FactoryBot.create(:project)

      project = FactoryBot.build(:project, name: project.name)

      expect(project).not_to be_valid
      expect(project.errors[:name]).to be_present
    end

    it "should ensure presence of description" do 
      project = FactoryBot.build(:project, description: nil)
      expect(project).not_to be_valid
      expect(project.errors[:description]).to be_present
    end

    it "should ensure presence of duration" do 
      project = FactoryBot.build(:project, duration: nil)
      expect(project).not_to be_valid
      expect(project.errors[:duration]).to be_present
    end

    it "should ensure presence of status" do 
      project = FactoryBot.build(:project, status: nil)
      expect(project).not_to be_valid
      expect(project.errors[:status]).to be_present
    end
    
  end

  describe "Associations" do

    it "should allow multiple issues" do
      project = FactoryBot.create(:project)

      3.times.each do |n|
        issue = FactoryBot.create(:issue)
        project.issues << issue
        project_issues = project.issues
        expect(project_issues.count).to eq n.next
        expect(project_issues).to include issue
      end
    end

  end



  describe "Graceful Destroyal" do

    it "should destroy the associated issues when deleted" do
      project = FactoryBot.create(:project)
      project.issues.create(FactoryBot.attributes_for(:issue))

      expect{ project.destroy }.to change(Issue, :count).by(-1)
    end

  end


  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end

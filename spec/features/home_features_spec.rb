require 'rails_helper'

RSpec.describe "Home", type: :feature do 

  before(:each) do 
    visit("/")
  end

  context "navbar title and links" do
    it "has title" do
      within("nav") do 
        # expect(page).to have_css("h1",text:"Issues Tracker")
        expect(page).to have_link("Issues Tracker",href: root_path)
      end
    end

    it "has project link" do 
      within("nav") do 
        expect(page).to have_link("Projects",href: projects_path)
      end
    end

    it "has issues link" do 
      within("nav") do 
        expect(page).to have_link("Issues",href: issues_path)
      end
    end 

    it "has employees link" do 
      within("nav") do 
        expect(page).to have_link("Employees",href: employees_path)
      end

    end

    it "has user accounts link" do 
      within("nav") do 
        expect(page).to have_link("User Accounts",href: accounts_path)
      end
    end

    it "has sign in" do 
      within("nav") do 
        expect(page).to have_link("Sign in")
      end
    end

    it "has signup link" do 
      within("nav") do 
        expect(page).to have_link("Sign up")
      end
    end
  end

  context "main section" do 
    it "displays home in main section" do 
      expect(page).to have_css("h1",text:"Home")
    end
  end

  context "footer" do 
    it "displays copyright information" do 
      within("footer") do 
        expect(page).to have_css("p",text:"2019, Enow Mbi")
      end
    end
  end

end

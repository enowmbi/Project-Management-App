require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects" do

    it 'returns http status of success' do
      get projects_path
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:html])
    end

    it "returns all projects" do
      2.times do |x|  
        FactoryBot.create(:project)
      end
      get "/projects.json"
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])
      expect(JSON.parse(response.body).size).to eq(Project.count)
    end

  end

  describe "GET /projects/id" do 

    it 'returns http status of success' do 
      project = FactoryBot.create(:project)
      get projects_path(project)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:html])
    end

    it 'returns JSON of project with id specified' do 
      project = FactoryBot.create(:project)
      get "/projects/#{project.id}.json"
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json]) 
      expect(JSON.parse(response.body)["name"]).to eq(project.name)
    end

  end

  describe "POST /projects" do 
  
    describe "with valid params" do

    it "increases the number of projects" do 
      project_attributes = FactoryBot.attributes_for(:project)

      expect{post "/projects", params:{project: project_attributes}}.to change(Project, :count).by(1)
      expect(response.content_type).to eq(Mime[:html])
    end


    it "redirects to the last project created" do 
      project_attributes = FactoryBot.attributes_for(:project)
      post projects_path, params:{project: project_attributes}
      expect(response).to have_http_status(302)
      # expect(response).to redirect_to projects_path(Project.last)
    end
    end
    describe "with invalid params" do 
     pending
    end
  end

  describe "PATCH /projects/id" do 
    let(:my_project){Project.first}
    let(:valid_params) {{ project: {name:"Learning ruby the hard way 2", description:"Learning ruby the hard way description" ,status:"Deployed",duration:2 } }}

    before(:each){patch project_url(my_project, params: valid_params)}


    it "returns the updated project" do
      # gets "/projects/#{my_project.id}.json"
      # expect(my_project.name).to eq("Learning ruby the hard way 2")
    end

    it "returns the correct status code" do 
     expect(response).to have_http_status(302)
    end

    it "returns the correct content-type" do 
       expect(response.content_type).to eq(Mime[:html])
    end
  end

end


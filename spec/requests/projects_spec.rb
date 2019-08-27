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

  xdescribe "POST /projects" do 
  
    describe "with valid params" do

    it "returns http status of created" do 
      project = FactoryBot.build(:project)
      post '/projects',params: project
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq(Mime[:html])
    end

    it "returns the last room category created"
       pending
    end

    describe "with invalid params" do 
     pending
    end
  end

end


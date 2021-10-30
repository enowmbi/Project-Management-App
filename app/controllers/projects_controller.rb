class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_team, only: %i[index new create edit sort_by_name_asc sort_by_name_desc sort_by_due_date_asc sort_by_due_date_desc sort_by_active_asc sort_by_active_desc sort_by_complete_asc sort_by_complete_desc sort_by_tasks_count_asc sort_by_tasks_count_desc]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all_projects(@team).includes(:tasks).most_recent_first
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @tasks = Task.where(project_id: @project)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects
  # POST /projects.json
  def create
    @project = @team.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to team_project_path(params[:team_id], @project), notice: 'Project was successfully created' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to team_project_path(params[:team_id], @project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to team_projects_url(params[:team_id]), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  sortables = %w[name due_date active complete tasks_count]

  sortables.each do |sortable|
    define_method "sort_by_#{sortable}_asc" do
      @projects = Project.all_projects(@team).includes(:tasks).send("ascending_#{sortable}")
      render action: :index
    end

    define_method "sort_by_#{sortable}_desc" do
      @projects = Project.all_projects(@team).includes(:tasks).send("descending_#{sortable}")
      render action: :index
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def set_team
    @team = Team.friendly.find(params[:team_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description, :due_date, :team_id)
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:index, :new,:create,:edit, :sort_by_title_asc, :sort_by_title_desc, :sort_by_priority_asc,:sort_by_priority_desc, :sort_by_complete_asc, :sort_by_complete_desc]
  before_action :set_team, only: [:new,:create,:edit]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all_tasks(@project)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to team_project_task_path(params[:team_id],@project,@task), notice: 'task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to team_project_task_path(params[:team_id],@task.project,@task), notice: 'task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to team_project_tasks_url(params[:team_id],@task.project), notice: 'task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  sortables = %w(title priority complete)

  sortables.each do |sortable|
    define_method "sort_by_#{sortable}_asc" do 
      @tasks = Task.all_tasks(@project).send("ascending_#{sortable}")
      render action: :index
    end

    define_method "sort_by_#{sortable}_desc" do 
      @tasks = Task.all_tasks(@project).send("descending_#{sortable}")
      render action: :index
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.friendly.find(params[:id])
  end

  def set_project
    @project = Project.friendly.find(params[:project_id])
  end

  def set_team
    @team = Team.friendly.find(params[:team_id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :description, :priority, :complete, :project_id,:due_date)
  end
end

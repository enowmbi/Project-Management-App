class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = current_user.teams.most_recent_first
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @invited_users = [] #:TODO Write a script that returns all users belonging to a team even those pending should be an outer join 
  end

  # GET /teams/new
  def new
    @team = current_user.teams.build
    @team.projects.build
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = current_user.teams.build(team_params)
    respond_to do |format|
      if @team.save && @membership = current_user.memberships.build(team_id: @team.id,owner: true).save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: [@team.errors,@membership.errors], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  sortables = %w(name active owner)

  sortables.each do |sortable|
    define_method "sort_by_#{sortable}_asc" do 
      @teams =current_user.teams.send("ascending_#{sortable}") 
      render action: :index
    end

    define_method "sort_by_#{sortable}_desc" do 
      @teams =current_user.teams.send("descending_#{sortable}") 
      render action: :index
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.includes(:memberships).friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name)
  end
end

module TeamsHelper
  def display_team_owner(team)
    team.users.where("memberships.owner = true").first.full_name 
  end
end

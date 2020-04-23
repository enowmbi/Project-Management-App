module TeamsHelper
  def display_team_owner(team)
    team.users.where("memberships.owner = true").first.name 
  end
end

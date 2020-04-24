module TeamsHelper
  def team_owner(team)
    team.users.where("memberships.owner = true").first.name 
  end

  def team_activity(team)
    team.active? ? 'Active' : 'Inactive'
  end
end

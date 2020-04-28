module TeamsHelper
  def team_owner(team)
    team.users.where("memberships.owner = true").first 
  end

  def team_activity(team)
    team.active? ? 'Active' : 'Inactive'
  end

  def active_members(team)
    User.joins([:teams]).where("team_id = ? AND users.slug is not NULL",team.id).group('users.id',:owner,:team_id,:confirmation_sent_at,
                                                                                       :invitation_accepted_at,'memberships.created_at').order('owner DESC').pluck(:name,:email,:owner,:confirmation_sent_at,                          :invitation_accepted_at,'memberships.created_at')
  end

  def team_members_pending_acceptance(team)
    User.joins([:teams]).where("team_id = ? AND invitation_token is NOT NULL AND invitation_accepted_at is NULL", team.id).group('users.id',:owner,:team_id,:invitation_accepted_at).order('invitation_sent_at DESC').pluck(:name,:email,:owner,:invitation_sent_at)
  end
end

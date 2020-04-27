class InvitationsController < Devise::InvitationsController

  def after_invite_path_for(resource)
    team_path(resource)
  end
end

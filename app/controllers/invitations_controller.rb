class InvitationsController < Devise::InvitationsController

  private

  def after_invite_path_for(resource)
    team_path(params[:team_id])
  end

  # this is called when creating invitation
  # should return an instance of resource class
  # def invite_resource
    # skip sending emails on invite
    # super { |user| user.skip_invitation = true }

    # TODO: give user a temporary membership

  # end

  # this is called when accepting invitation
  # should return an instance of resource class
  # def accept_resource
    # resource = resource_class.accept_invitation!(update_resource_params)

    #TODO: update temporary membership to perminant membership

    # Report accepting invitation to analytics
    # Analytics.report('invite.accept', resource.id)
    # resource
  # end

end

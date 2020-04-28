class InvitationsController < Devise::InvitationsController

  def create
    user = User.find_by_email(params[:user][:email])
    unless user 
      user = User.new({name: params[:user][:name],email: params[:user][:email]})
      user.skip_confirmation!
      user.save
    end

    User.invite!({name: user.name,email: user.email}, current_user)
    membership = Membership.new({user_id: User.last.id,team_id: params[:team_id],invitation_status: 'pending'})
    membership.save
    redirect_to team_path(params[:team_id]),notice: "Invitation has been sent to #{params[:user][:name]}"
  end

end

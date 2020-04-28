class InvitationsController < Devise::InvitationsController

  def create
    user = User.new(name: params[:user][:name],email: params[:user][:email])
    unless User.exists?(user.id)
      user.skip_confirmation!
      user.save
    end
    User.invite!({name: user.name,email: user.email}, current_user)
    redirect_to team_path(params[:team_id]),notice: 'Invitation has been sent to #{params[:user][:name]}'
  end

end

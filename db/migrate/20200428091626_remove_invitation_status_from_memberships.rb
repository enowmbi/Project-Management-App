class RemoveInvitationStatusFromMemberships < ActiveRecord::Migration[6.0]
  def change
    remove_column :memberships, :invitation_status,:string
  end
end

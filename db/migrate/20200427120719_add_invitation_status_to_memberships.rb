class AddInvitationStatusToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :invitation_status, :string
  end
end

class AddIssuesToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :issue, foreign_key: true
  end
end

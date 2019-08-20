class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.date :assigned_on
      t.string :status
      t.date :resolved_on

      t.timestamps
    end
  end
end

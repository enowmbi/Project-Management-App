class AddTimeStampToMembershipsTable < ActiveRecord::Migration[6.0]
  def change
       add_timestamps :memberships,default: ->{'now()'},null: false
  end
end

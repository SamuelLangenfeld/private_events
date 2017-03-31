class AddEventIdToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :event_id, :integer
  end
end

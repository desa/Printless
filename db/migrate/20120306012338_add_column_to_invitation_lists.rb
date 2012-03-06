class AddColumnToInvitationLists < ActiveRecord::Migration
  def change
    add_column :invitation_lists, :journalist, :boolean

  end
end

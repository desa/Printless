class CreateInvitationLists < ActiveRecord::Migration
  def change
    create_table :invitation_lists do |t|
      t.string :email

      t.timestamps
    end
    add_index :invitation_lists, :email
  end
end

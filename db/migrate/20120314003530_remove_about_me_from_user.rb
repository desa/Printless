class RemoveAboutMeFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :about_me
      end

  def down
    add_column :users, :about_me, :text
  end
end

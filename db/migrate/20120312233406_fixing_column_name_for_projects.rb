class FixingColumnNameForProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :writer_id, :user_id
  end
end

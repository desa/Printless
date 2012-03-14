class RemoveContentFromProject < ActiveRecord::Migration
  def up
    remove_column :projects, :content
      end

  def down
    add_column :projects, :content, :text
  end
end

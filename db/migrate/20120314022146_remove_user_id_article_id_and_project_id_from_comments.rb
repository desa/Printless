class RemoveUserIdArticleIdAndProjectIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :user_id
        remove_column :comments, :article_id
        remove_column :comments, :project_id
      end

  def down
    add_column :comments, :project_id, :integer
    add_column :comments, :article_id, :integer
    add_column :comments, :user_id, :integer
  end
end

class RemoveCommentIdAndCommentTypeFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :comment_id
        remove_column :comments, :comment_type
      end

  def down
    add_column :comments, :comment_type, :string
    add_column :comments, :comment_id, :integer
  end
end

class AddCommentableIdAndCommentTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :integer

    add_column :comments, :comment_type, :string

  end
end

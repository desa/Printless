class AddContentFromArticle < ActiveRecord::Migration
  def change
    add_column :articles, :content, :text

  end
end

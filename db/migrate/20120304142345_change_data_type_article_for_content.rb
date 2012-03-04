class ChangeDataTypeArticleForContent < ActiveRecord::Migration
  def up
    change_table :articles do |t|
      t.change :content, :text
    end
  end

  def down
    change_table :articles do |t|
      t.change :content, :string
    end
  end
end

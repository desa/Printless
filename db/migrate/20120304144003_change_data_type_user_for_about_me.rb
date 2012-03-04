class ChangeDataTypeUserForAboutMe < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :about_me, :text
    end
  end

  def down
    change_table :users do |t|
      t.change :about_me, :string
    end
  end
end

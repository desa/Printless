class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :about_me
      t.boolean :journalist
      t.string :twitter_id
      t.string :interests

      t.timestamps
    end
  end
end

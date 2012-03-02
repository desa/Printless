class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :writer_id
      t.string :title
      t.string :content
      t.integer :money_wanted
      t.integer :money_earned
      t.string :subject
      t.datetime :finish_date

      t.timestamps
    end
    add_index :projects, [:writer_id, :created_at]
  end
end

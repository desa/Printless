class CreateDontaions < ActiveRecord::Migration
  def change
    create_table :dontaions do |t|
      t.integer :donator_id
      t.integer :donatee_id
      t.datetime :charged_at
      t.integer :amount
      t.integer :project_id
      t.integer :writer_id

      t.timestamps
    end
  end
end

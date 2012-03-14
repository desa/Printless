class CreateDontations < ActiveRecord::Migration
  def change
    create_table :dontations do |t|
      t.integer :donator_id
      t.integer :donatee_id
      t.datetime :charged_at
      t.integer :amount
      t.string :donatable_type
      t.integer :donatable_id

      t.timestamps
    end
  end
end

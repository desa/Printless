class DropTableDontaions < ActiveRecord::Migration
  def change
    drop_table(:dontaions)
  end
end

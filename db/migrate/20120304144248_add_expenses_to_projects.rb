class AddExpensesToProjects < ActiveRecord::Migration
  def change
      add_column :projects, :expenses, :text
  end
end

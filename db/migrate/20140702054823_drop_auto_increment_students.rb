class DropAutoIncrementStudents < ActiveRecord::Migration
  def change
	change_column :students, :id, :integer
  end
end

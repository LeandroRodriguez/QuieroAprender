class DropAutoIncrementTeachers < ActiveRecord::Migration
  def change
	change_column :teachers, :id, :integer
  end
end

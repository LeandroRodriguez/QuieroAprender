class RemoveDescriptionFromTeacher < ActiveRecord::Migration
  def change
    remove_column :teachers, :description, :string
  end
end

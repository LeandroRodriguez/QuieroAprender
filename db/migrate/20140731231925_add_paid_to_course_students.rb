class AddPaidToCourseStudents < ActiveRecord::Migration
  def change
    add_column :course_students, :paid, :boolean
  end
end

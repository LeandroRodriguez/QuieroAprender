class CreateCourseStudents < ActiveRecord::Migration
  def change
    create_table :course_students do |t|
      t.references :course, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end

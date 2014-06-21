class CreateCourseStudents < ActiveRecord::Migration
  def change
    create_table :course_students do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end

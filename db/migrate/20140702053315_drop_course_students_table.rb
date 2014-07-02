class DropCourseStudentsTable < ActiveRecord::Migration
  def up
    drop_table :course_students unless !ActiveRecord::Base.connection.table_exists? :course_students
  end

  def down
    
  end
end



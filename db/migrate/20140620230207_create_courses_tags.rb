class CreateCoursesTags < ActiveRecord::Migration
  def change
    create_table :courses_tags, id: false do |t|
      t.belongs_to :course
      t.belongs_to :tag
    end
  end
end

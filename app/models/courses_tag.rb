class CoursesTag < ActiveRecord::Base
  belongs_to :course
  belongs_to :tag
end


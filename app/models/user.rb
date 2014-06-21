class User < ActiveRecord::Base
	has_many :course_students
	has_many :courses, :through => :course_students
	
	acts_as_authentic do |c|
    c.login_field = 'email'
  end # block optional
  
end

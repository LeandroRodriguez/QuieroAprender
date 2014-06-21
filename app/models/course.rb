class Course < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
	belongs_to :subcategory
	has_many :course_students
	has_many :users, :through => :course_students
end

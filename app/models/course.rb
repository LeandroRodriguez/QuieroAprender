class Course < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
	belongs_to :subcategory
	has_many :course_students
	has_many :students, :through => :course_students
	has_many :course_teachers
	has_many :teachers, :through => :course_teachers
	has_and_belongs_to_many :tags
	has_many :opinions
	has_many :consultations
end

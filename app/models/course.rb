#encoding: utf-8
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

	def get_rating_average
		@avg = 0
		self.opinions.each do |op|
			@avg += (op.rating.nil? ? 0 : op.rating)
		end
		@avg = ( @avg / self.opinions.size) if self.opinions.size > 0
		return @avg 
	end
end

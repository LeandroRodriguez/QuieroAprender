class User < ActiveRecord::Base
	has_many :course_students
	has_many :courses, :through => :course_students
	
	validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  
  #attr_accessor :password
  #attr_accessor :password_confirmation
	
	acts_as_authentic do |c|
    c.login_field = 'email'
  end # block optional
  
end

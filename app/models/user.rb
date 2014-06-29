class User < ActiveRecord::Base
	has_many :course_students
	has_many :courses, :through => :course_students
	
	validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create
	
	acts_as_authentic do |c|
    c.login_field = 'email'
    c.logged_in_timeout = 30*60 # default is 10 minutes
  end # block optional
  
  ROLES = [ROLE_STUDENT = 5, ROLE_TEACHER = 10, ROLE_ADMIN = 20]

  validates :role, inclusion: {in: ROLES}

  after_initialize :default_values
  
  attr_accessor :role_desc
 
  def role_desc
    case role
    when User::ROLE_STUDENT
      role_desc = 'Estudiante'
    when User::ROLE_TEACHER
      role_desc = 'Profesor'
    when User::ROLE_ADMIN
      role_desc = 'Admin'
    end
  end
  
  def student?
    self.role == User::ROLE_STUDENT
  end
  
  def teacher?
    self.role == User::ROLE_TEACHER
  end
  
  def admin?
    self.role == User::ROLE_ADMIN
  end
  
  private

  def default_values
    self.role ||= User::ROLE_STUDENT
  end 
  
end

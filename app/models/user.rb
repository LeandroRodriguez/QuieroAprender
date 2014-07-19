class User < ActiveRecord::Base
	
	validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  validates :name, presence: true, :on => :create
	
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
  
  def create_from_facebook(facebook_data)
    #facebook_data_array = JSON.parse(facebook_data)
    if !User.exists?(:email => facebook_data["email"])
      puts "no user with that email"
      self.email = facebook_data["email"]
      self.password = '123456'
      self.password_confirmation = '123456'
      self.name = facebook_data["name"]
      self.save
    end
    
  end
  
  private

  def default_values
    self.role ||= User::ROLE_STUDENT
  end 
  
end

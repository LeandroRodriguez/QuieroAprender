class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  
  acts_as_authentic do |c|
    c.login_field = 'email'
  end # block optional
  
  def admin?
    #self.role == User::ROLE_ADMIN
    true
  end
  
end

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else 
      if user.teacher?
        can :manage, [UserSession, Course, CourseStudent, Teacher]
        can :manage, User
        can :manage, [:welcome, :user_facebook_session]
      else
        can :manage, [UserSession]
        can :manage, User
        can :manage, [:welcome, :user_facebook_session]
        #can [:signup, :profile, :edit_profile], User
      end
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # Or another example 
    # 
    #   can :update, User, :id => user.id
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

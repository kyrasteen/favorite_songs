class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)
     alias_action :create, :read, :update, :destroy, :to => :crud
     can :read, User, id: user.id
    if user.admin?
       can :crud, :all
    else
      can :read, :all
    end

  end
end

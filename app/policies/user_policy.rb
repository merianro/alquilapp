# Often, you will want to have some kind of view listing records which a particular user has access to.
# When using Pundit, you are expected to define a class called a policy scope. It can look something like
# this:


class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
       @user = user
       @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else 
        scope.where(role: 'user' )
      end
   end
end
  def index?
    @current_user.admin? or @current_user.su?
  end

  def show?
    @current_user.admin? # or is_owner?
  end

  private 
  def is_owner?
    current_user = @user
  end

  # todavia no funciona
end
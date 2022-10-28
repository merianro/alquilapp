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
        scope.where(user: user)
      end
   end
end

  def index?
    @current_user.admin? or @current_user.su?
  end

  def show?
    @current_user.admin? # or is_owner?
  end

  def edit?
    update?
  end

  def update?
    @current_user.admin? # or is_owner?
  end

  private 
  # todavia no funciona
  def is_owner?
    current_user = @user
  end

  
end
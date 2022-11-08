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

  def suindex?
    @current_user.admin?
  end

  def newsu?
    @current_user.admin?
  end

  def show?
  end

  def edit?
    update?
  end

  def update?
    true
  end
  
  def create_su
  end

  private 
  # todavia no funciona


  
end
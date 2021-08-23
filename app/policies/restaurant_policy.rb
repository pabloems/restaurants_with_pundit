class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Ayuda a modificar lo que se ve en vistas ej: scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end
    # El record sobre el cual authorize ( en este caso @restaurant)
    # Current_user => user
      # If user == record.user
      # return true
      # else
        # return false
      # end

   def destroy?
    user_is_owner_or_admin?
   end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end

end

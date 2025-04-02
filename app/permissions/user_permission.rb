class UserPermission < ApplicationPermission
  resource_as :user

  def update?
    user == current_user
  end
  alias_method :edit?, :update?
  alias_method :destroy?, :update?
end

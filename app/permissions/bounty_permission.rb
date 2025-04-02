class BountyPermission < ApplicationPermission
  resource_as :bounty

  def update?
    bounty.user == current_user
  end
  alias_method :edit?, :update?
  alias_method :destroy?, :update?
end

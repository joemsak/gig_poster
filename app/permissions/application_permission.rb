class ApplicationPermission
  attr_reader :resource, :current_user

  def self.resource_as(alias_name)
    alias_method alias_name, :resource
  end

  def initialize(resource:, current_user:)
    @resource = resource
    @current_user = current_user
  end

  def allowed?(action_name:)
    send("#{action_name}?")
  end
end

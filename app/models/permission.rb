class Permission
  class << self
    def for(resource:, current_user:)
      type_for(resource).new(resource:, current_user:)
    end

    private

      def type_for(resource)
        "#{resource.class.name}Permission".constantize
      end
  end
end

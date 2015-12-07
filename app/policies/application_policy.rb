class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user   = user
    @record = record
  end

  # Convenience method to define `index?`, `show?`, etc en masse
  def self.allow_access_for_roles(hash)
    hash.each do |action, roles|
      define_method "#{action}?" do
        roles.any? { |role| user.has_role?(role) }
      end
    end
  end

end

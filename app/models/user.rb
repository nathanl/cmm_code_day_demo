class User < ActiveRecord::Base

  has_secure_password

  has_many :user_roles, class_name: "UserRole"
  has_many :roles, through: :user_roles, dependent: :destroy

  validates :email, :password_digest, presence: true

  def has_role?(role_name)
    return true if role_name.to_s == "default"
    roles.map(&:name).include?(role_name)
  end

  def add_role!(role_name)
    role = Role.find_by!(name: role_name)
    unless UserRole.exists?(user: self, role: role)
      UserRole.create!(user: self, role: role)
    end
  end

  def remove_role!(role_name)
    role = Role.find_by!(name: role_name)
    user_roles.find_by(role: role).try(:destroy)
  end

end

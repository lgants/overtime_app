class AuditLogPolicy < ApplicationPolicy
  # these methods override the methods in the parent class
  def index?
  	return true if admin?
  end

  private
  	def admin?
  		admin_types.include?(user.type)
  	end
end

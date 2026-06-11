class OrganizationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.super_admin? || user.admin?
  end

  def update?
    user.super_admin? || user.admin?
  end

  def destroy?
    user.super_admin?
  end
end

class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.super_admin? || user.admin? || user.manager?
  end

  def update?
    user.super_admin? || user.admin? || user.manager?
  end

  def destroy?
    user.super_admin? || user.admin?
  end
end

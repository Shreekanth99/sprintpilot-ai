class EpicPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.super_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.super_admin?
  end
end
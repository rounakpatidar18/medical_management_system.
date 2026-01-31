# app/policies/doctor_policy.rb
class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.receptionist?
        scope.all
      else
        scope.active
      end
    end
  end

  def index?
    staff?
  end

  def show?
    staff?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  private

  def staff?
    user.admin? || user.receptionist? || user.doctor?
  end
end

class PatientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if staff?
        scope.where(active: true)
      else
        scope.none
      end
    end

    private

    def staff?
      user.admin? || user.doctor? || user.nurse? || user.receptionist?
    end
  end

  def index?
    staff?
  end

  def show?
    staff?
  end

  def create?
    user.admin? || user.receptionist?
  end

  def update?
    user.admin? || user.doctor? || user.nurse?
  end

  def destroy?
    user.admin?
  end

  private

  def staff?
    user.admin? || user.doctor? || user.nurse? || user.receptionist?
  end
end

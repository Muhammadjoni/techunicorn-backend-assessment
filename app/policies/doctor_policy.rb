class DoctorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  # Who can edit or destroy a doctor ?
  # the doctor or the admin
  def update?
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end

  def my_appointments?
    true
  end

  private

  def admin_or_owner?
    owner? || admin?
  end

  def admin?
    @user.admin
  end

  def doctor?
    @record.user == @user
  end
end

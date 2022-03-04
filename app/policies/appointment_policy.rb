class AppointmentPolicy < ApplicationPolicy
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

  # Who can edit a appointment ?
  # the doctor or the admin
  def update?
    admin_or_doctor?
  end

  # Who can destroy a doctor ?
  # The admin or doctor
  def destroy?
    admin_or_doctor?
  end

  private

  def admin_or_doctor?
    doctor? || admin?
  end

  def admin?
    @user.admin
  end

  def doctor?
    @record.user == @user.doctor
  end
end

class PatientPolicy < ApplicationPolicy
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

  # Who can edit a patient ?
  # the patient or the clinic admin
  def update?
    admin_or_owner?
  end

  # Who can destroy a patient ?
  # The clinic admin or patient
  def destroy?
    admin_or_owner?
  end

  def my_sessions?
    true
  end

  private

  def admin_or_owner?
    owner? || admin?
  end

  def admin?
    @user.admin
  end

  def owner?
    @record.user == @user
  end
end

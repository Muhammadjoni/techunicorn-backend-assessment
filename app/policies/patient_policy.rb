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
    admin_or_patient?
  end

  # Who can destroy a patient ?
  # The clinic admin or patient

  def destroy?
    admin_or_patient?
  end

  # def my_rents?
  #   true
  # end

  private

  def admin_or_patient?
    patient? || admin?
  end

  def admin?
    @user.admin
  end

  def patient?
    @record.user == @user
  end
end

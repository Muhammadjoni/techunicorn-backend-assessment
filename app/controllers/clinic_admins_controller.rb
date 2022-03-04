class ClinicAdminsController < ApplicationController
  before_action :set_clinic_admin, only: [:show, :update, :destroy]

  def index
   @doctors = Doctor.all
   @patients = Patient.all
  end

  def show
    authorize @clinic_admin
  end

  def update
    @clinic_admin.update(clinic_admin)
    redirect_to @clinic_admin
    authorize @clinic_admin
  end

  def destroy
    authorize @clinic_admin
    @clinic_admin.destroy
    redirect_to my_appointments_doctors_path
  end

  private

  def set_clinic_admin
    @clinic_admin = ClinicAdmin.find(params[:id])
  end

end

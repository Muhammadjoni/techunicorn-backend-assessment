class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
   @patients = current_user.patient
  end

  def show
    @patient = Patient.new

    if user_signed_in?
      @display_form = current_user.appointments.where(patient: @patient).size.positive?
    else
      @display_form = false
    end
    authorize @patient
  end

  def new
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.create(patient_params)
    @patient.user = current_user
    authorize @patient

    if @patient.save
      redirect_to @patient, notice: 'patient was successfully created.'
    else
      render :news
    end
  end

  def edit
    authorize @patient
  end

  def update
    @patient.update(patient_params)
    redirect_to @patient
    authorize @patient
  end

  def destroy
    authorize @patient
    @patient.destroy
    redirect_to my_sessions_patients_path
  end

  def my_sessions
    @patients = current_user.patients
    authorize patient.new
  end

  private

  def set_patient
    @patient = patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name)
  end
end

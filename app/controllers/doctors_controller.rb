class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
   @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.new

    if user_signed_in?
      @display_form = current_user.appointments.where(doctor: @doctor).size.positive?
    else
      @display_form = false
    end
    authorize @doctor
  end

  def new
    @doctor = Doctor.new
    authorize @doctor
  end

  def create
    @doctor = Doctor.create(doctor_params)
    @doctor.user = current_user
    authorize @doctor

    if @doctor.save
      redirect_to @doctor, notice: 'Doctor was successfully created.'
    else
      render :news
    end
  end

  def edit
    authorize @doctor
  end

  def update
    @doctor.update(doctor_params)
    redirect_to @doctor
    authorize @doctor
  end

  def destroy
    authorize @doctor
    @doctor.destroy
    redirect_to my_appointments_doctors_path
  end

  def my_appointments
    @doctors = current_user.doctors
    authorize doctor.new
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :profession)
  end
end

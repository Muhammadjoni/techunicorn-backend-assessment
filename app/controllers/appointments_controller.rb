class AppointmentsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
   @appointments = current_user.appointments
  end

  def show
    @appointment = appointment.new

    if user_signed_in?
      @display_form = current_user.appointments.where(appointment: @appointment).size.positive?
    else
      @display_form = false
    end
    authorize @appointment
  end

  def new
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointment.user = current_user
    authorize @appointment

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :news
    end
  end

  def edit
    authorize @appointment
  end

  def update
    @appointment.update(appointment_params)
    redirect_to @appointment
    authorize @appointment
  end

  def destroy
    authorize @appointment
    @appointment.destroy
    redirect_to root_path
  end

  def my_appointments
    @appointments = current_user.appointments
    authorize appointment.new
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_time, :appointment_duration, :appointment_day, :doctor_id, :patient_id)
  end
end

# app/controllers/doctors_controller.rb
class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: %i[show edit update destroy]
  after_action :verify_authorized

  def index
    @doctors = policy_scope(Doctor)
    authorize Doctor
  end

  def show
    authorize @doctor
  end

  def new
    @doctor = Doctor.new
    authorize @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)
    authorize @doctor

    if @doctor.save
      redirect_to @doctor, notice: "Doctor registered successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @doctor
  end

  def update
    authorize @doctor

    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: "Doctor updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @doctor
    @doctor.update!(active: false)
    redirect_to doctors_path, notice: "Doctor deactivated"
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(
      :user_id,
      :first_name,
      :last_name,
      :specialization,
      :medical_license_number,
      :phone
    )
  end
end

# app/controllers/patients_controller.rb
class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[show edit update destroy]
  after_action :verify_authorized



  def index
    authorize Patient
    @patients = policy_scope(Patient)
  end

  def show
    authorize @patient
  end

  def new
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    authorize @patient

    if @patient.save
      redirect_to @patient, notice: "Patient created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @patient
  end

  def update
    authorize @patient

    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @patient
    @patient.update(active: false)
    redirect_to patients_path, notice: "Patient archived"
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :user_id,
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :phone,
      :address,
      :blood_group,
      :emergency_contact
    )
  end
end

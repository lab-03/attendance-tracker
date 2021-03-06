class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  def index
    @students = Student.all

    render json: StudentSerializer.new(@students).serializable_hash
  end

  # GET /students/1
  def show
    render json: StudentSerializer.new(@student).serializable_hash
  end

  def profile
    render json: @current_userable, status: :ok
  end

  # POST /students


  def create
    @student = Student.new(student_params)
    assign_user_params
    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:image)
  end

  def user_params
    params.require(:student).permit(:first_name, :last_name, :email, :password)
  end

  def assign_user_params
    @student.user.update(user_params)
    @student.user.save!
  end
end

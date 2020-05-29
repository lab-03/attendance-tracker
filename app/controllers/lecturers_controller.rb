class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :update, :destroy]

  # GET /lecturers
  def index
    @lecturers = Lecturer.all

    render json: @lecturers
  end

  # GET /lecturers/1
  def show
    render json: @lecturer
  end

  # POST /lecturers
  def create
    @lecturer = Lecturer.new(lecturer_params)

    if @lecturer.save
      render json: @lecturer, status: :created, location: @lecturer
    else
      render json: @lecturer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lecturers/1
  def update
    if @lecturer.update(lecturer_params)
      render json: @lecturer
    else
      render json: @lecturer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lecturers/1
  def destroy
    @lecturer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lecturer_params
      params.fetch(:lecturer, {})
    end
end

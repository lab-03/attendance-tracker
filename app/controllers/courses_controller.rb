class CoursesController < ApplicationController

  before_action :set_course, only: [:report, :show]
  def index
    @courses = @current_userable.courses
    render json: @courses
  end

  def create
    course = @current_userable.courses.create(course_params)
    render json: course, code: :ok
  end

  def show
    render json: @course
  end

  def report
    render json: @course, serializer: CourseReportSerializer, code: :ok
  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :code)
  end


end

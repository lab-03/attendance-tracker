class CoursesController < ApplicationController

  def index
    @courses = Course.all
    render json: CourseSerializer.new(@courses).serializable_hash
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end


end

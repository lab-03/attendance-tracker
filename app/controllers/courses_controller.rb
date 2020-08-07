class CoursesController < ApplicationController

  def index
    @courses = @current_userable.courses
    render json: @courses
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end


end
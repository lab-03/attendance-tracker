class CourseGroupsController < ApplicationController

  def index
    @cg = CourseGroup.all
    render json: @cg
  end

  def show
    @cg = CourseGroup.find(params[:id])
    render json: @cg
  end


end

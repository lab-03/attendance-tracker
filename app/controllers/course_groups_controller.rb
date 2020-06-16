class CourseGroupsController < ApplicationController

def index
  @cg=CourseGroup.all
  render json:  CourseGroupSerializer.new(@cg).serializable_hash
 end

 def show
   
   @cg=CourseGroup.find(params[:id])
   render json:  CourseGroupSerializer.new(@cg).serializable_hash

 end





end

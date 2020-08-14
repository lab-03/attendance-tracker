class LoadTestsController < ApplicationController
  def create
    render json: TestAttendance.call(@current_userable)
  end
end
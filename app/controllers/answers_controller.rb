class AnswersController < ApplicationController

  def create
    answer_attributes = answer_params.to_h.merge(ownerable_type: "Student", ownerable_id: @current_userable.id )
    SaveAnswersJob.perform_async(answer_attributes) if params[:answer].present?
    render json: {status: "success", message: "saving the answers"}, code: :ok
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :text, :rating, :choice_id)
  end

end
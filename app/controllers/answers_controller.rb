class AnswersController < ApplicationController
  def create
    answers = answer_params.to_h[:answers] || []
    SaveAnswersJob.perform_async(@current_userable.id, answers) unless answers.empty?
    render json: "saving the answers", code: :ok
  end

  private

  def answer_params
    params.permit(answers: [:question_id, :text, :rating, :choice_id])
  end

end
class QuestionsController < ApplicationController

  def index
    questions = Question.where(id: param[:id])
    render json: questions, code: :ok
  end
end
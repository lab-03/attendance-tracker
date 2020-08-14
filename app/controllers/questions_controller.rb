class QuestionsController < ApplicationController

  before_action :set_question, only: [:show]
  def index
    questions = Question.where(id: param[:id])
    render json: questions, code: :ok
  end

  def show
    render json:  @question, status: :ok
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
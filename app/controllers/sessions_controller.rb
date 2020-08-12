class SessionsController < ApplicationController

  before_action :set_session_by_token, only: [:attend, :show, :end, :report, :get_quiz_result,
                                              :interactive_quiz, :invalidate_attendance]
  before_action :set_quiz, only: [:get_quiz_result]
  # before_action :set_attendance, only: [:invalidate_attendance]
  # before_action :set_session_by_id, only: [:show]

  def index
    render json: @current_userable.sessions, code: :ok
  end

  def create
    session = Session.new(session_params.merge(lecturer_id: @current_userable.id))
    resp = CreateSession.call(session)
    render json: resp.data, code: resp.code
  end

  def show
    render json: @session, serializer: SessionAttendanceSerializer, code: :ok
  end

  def attend
    attendance = StudentVerify.call(@session, @current_userable, attend_params)
    render json: attendance.data, code: attendance.code
  end

  def interactive_quiz
    quiz = @session.interactive_quizzes.new(quiz_params)
    unless quiz.valid?
      render json: quiz.errors.full_messages.join(", "), code: 422
      return
    end
    quiz.save!
    SendInteractiveQuizJob.perform_async(@session.id, quiz.id)
    render json: {status: "success", message: "sending the quiz to the attended students"}, code: :ok
  end

  def get_quiz_result
    render json: @quiz, code: :ok
  end

  def end
    @session.end_session
    render json: @session, code: :ok
  end

  def invalidate_attendance
    student_id = params.require(:student_id)
    attendance = @session.attendances.where(verified: true, student_id: student_id).first
    if attendance.present?
      attendance.update!(verified: false, failure_message: "invalidate by the lecturer #{@current_userable.name}")
      render json: {status: "success", message: "attendance invalidated"}, status: :ok
    else
      render json: {status: "error", message: "the student is not verified"}, status: :unprocessable_entity
    end
  end


  def feedback
    render json: (@session.ended_at.present? ? @session.feedback : "Session has not finished yet!"), code: :ok
  end

  def report
    render json: @session, serializer: SessionReportSerializer, code: :ok
  end

  private

  def set_session_by_token
    @session = Session.find_by!(token: params[:token])
  end

  def set_session_by_id
    @session = @current_userable.sessions.find(params[:id])
  end

  def set_quiz
    @session.interactive_quizzes.find(params[:quiz_id])
  end

  def session_params
    params.require(:session).permit(:classable_id, :classable_type, :lat, :long, :apply_checks)
  end

  def attend_params
    params.permit(:captured_face, :lat, :long)
  end

  def quiz_params
    params.require(:interactive_quiz).permit(
        :name, :ended_at,
        questions_attributes: [:text, :is_rating, :is_text, choices_attributes: [:text, :correct]]
    )
  end

end
class SessionsController < ApplicationController

  before_action :set_session_by_token, only: [:attend, :show, :end]
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

  def send_interactive_question
    # send the notification to the students attended this session
    render json: "Sending the Question/s to the attended students", code: :ok
  end

  def end
    @session.end_session
    render json: @session, code: :ok
  end


  def feedback
    render json: (@session.ended_at.present? ? @session.feedback : "Session has not finished yet!"), code: :ok
  end

  private

  def set_session_by_token
    @session = Session.find_by!(token: params[:token])
  end

  def set_session_by_id
    @session = @current_userable.sessions.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:classable_id, :classable_type, :lat, :long, :apply_checks)
  end

  def attend_params
    params.permit(:captured_face, :lat, :long)
  end
end
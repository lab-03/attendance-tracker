class FeedBacksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_feed_back, only: :show

  def show
    render json: @feed_back.questions, each_serializer: QuestionSerializer, status: :ok
  end

  private

  def set_feed_back
    @feed_back = FeedBack.find params[:id]
  end

end
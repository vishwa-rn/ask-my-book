class Api::QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  def create
    question = params[:question]
    answer = AnswerService.new(question).fetch
    render json: { answer: answer }, status: :ok
  end

  private

  def compute_answer(question)
    # Add your answer computation logic here
    return "Hello world!"
  end
end

private

def json_request?
  request.format.json?
end
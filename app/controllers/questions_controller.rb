class QuestionsController < ApplicationController

  def create
    CloneyService.new.create_question(question_params)
    redirect_to root_path
  end

  private

  def question_params
    params.permit(:title, :category_id, :body, :user_id)
  end
end

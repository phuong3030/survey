class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  def index
    @questions = Question::Base.all
  end

  def create
    @question = Question::Base.generate(question_params)

    if @question.save
      render('questions/show.rabl', object: @question, status: :created)
    else
      render('questions/show.rabl', object: @question, status: :unprocessable_entity).html_safe
    end
  end

  def update
    if @question.update(question_params)
      render('questions/show.rabl', object: @question)
    else
      render('questions/show.rabl', object: @question, status: :unprocessable_entity).html_safe
    end
  end

  def destroy
    @question.destroy
  end

  private
    def set_question
      @question = Question::Base.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:prompt, :type)
    end
end

class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def answers
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      render("surveys/show.rabl", object: @survey, status: :created).html_safe
    else
      render("surveys/show.rabl", object: @survey, status: :unprocessable_entity).html_safe
    end
  end

  def update
    @survey.assign_attributes(survey_params)
    if @survey.save(context: :answer_questions)
      render("surveys/show.rabl", object: @survey).html_safe
    else
      render("surveys/show.rabl", object: @survey, status: :unprocessable_entity).html_safe
    end
  end

  def destroy
    @survey.destroy
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(
        respondent_attributes: [:first_name, :last_name, profile_attributes: [:gender, :department]],
        questions_attributes: [:prompt, :type, :optional],
        answers_attributes: [:id, :body]
      )
    end
end

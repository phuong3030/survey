class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def answer_scored_average
    render json: { question_averages: Answer::Scored.calculate_body_average }
  end

  def create
    @survey = Survey.new(survey_params)
    put_questions
    byebug

    if @survey.save
      render("surveys/show.rabl", object: @survey, status: :created).html_safe
    else
      render("surveys/show.rabl", object: @survey, status: :unprocessable_entity).html_safe
    end
  end

  def update
    @survey.assign_attributes(update_survey_params)
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

    def put_questions
      base = params.require(:survey).permit(questions_attributes: [:id])
      Question::Base.where(id: base[:questions_attributes].to_a.map { |p| p[:id] }).each do |question|
        @survey.questions << question if question.persisted?
      end
    end

    def survey_params
      base = params.require(:survey).permit(
        respondent_attributes: [:first_name, :last_name, profile_attributes: [:gender, :department]],
        questions_attributes: [:id, :prompt, :type, :optional],
        answers_attributes: [:id, :body]
      )
      base[:questions_attributes] = base[:questions_attributes].select { |qa| qa[:id].nil? }
      base
    end

    def update_survey_params
      params.require(:survey).permit(answers_attributes: [:id, :body])
    end
end

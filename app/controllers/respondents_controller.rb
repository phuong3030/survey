class RespondentsController < ApplicationController
  before_action :set_respondent, only: [:show, :update, :destroy]

  def index
    @respondents = Respondent.all
  end

  def create
    @respondent = Respondent.new(respondent_params)

    if @respondent.save
      render("respondents/show.rabl", object: @respondent, status: :created).html_safe
    else
      render("respondents/show.rabl", object: @respondent, status: :unprocessable_entity).html_safe
    end
  end

  def update
    if @respondent.update(respondent_params)
      render("respondents/show.rabl", object: @respondent)
    else
      render("respondents/show.rabl", object: @respondent, status: :unprocessable_entity).html_safe
    end
  end

  def destroy
    @respondent.destroy
  end

  private
    def set_respondent
      @respondent = Respondent.find(params[:id])
    end

    def respondent_params
      params.require(:respondent).permit(:first_name, :last_name, profile_attributes: [:gender, :department])
    end
end

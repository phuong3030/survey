require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
  render_views

  let(:valid_attributes) { build(:survey, respondent: build(:respondent)).as_json }

  let(:invalid_attributes) { build(:survey, respondent_id: nil).as_json }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      survey = Survey.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      survey = Survey.create! valid_attributes
      get :show, params: {id: survey.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Survey" do
        expect {
          post :create, params: {survey: valid_attributes}, session: valid_session
        }.to change(Survey, :count).by(1)
      end

      it "renders a JSON response with the new survey" do

        post :create, params: {survey: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new survey" do

        post :create, params: {survey: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { build(:survey).as_json }

      it "updates the requested survey" do
        survey = Survey.create! valid_attributes
        put :update, params: {id: survey.to_param, survey: new_attributes}, session: valid_session
        survey.reload
      end

      it "renders a JSON response with the survey" do
        survey = Survey.create! valid_attributes

        put :update, params: {id: survey.to_param, survey: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the survey" do
        survey = Survey.create! valid_attributes

        put :update, params: {id: survey.to_param, survey: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested survey" do
      survey = Survey.create! valid_attributes
      expect {
        delete :destroy, params: {id: survey.to_param}, session: valid_session
      }.to change(Survey, :count).by(-1)
    end
  end

end

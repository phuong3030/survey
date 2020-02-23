require 'rails_helper'

RSpec.describe RespondentsController, type: :controller do
  render_views

  let(:valid_attributes) { build(:respondent).as_json }

  let(:invalid_attributes) { build(:respondent, first_name: false).as_json }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      respondent = Respondent.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      respondent = Respondent.create! valid_attributes
      get :show, params: {id: respondent.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Respondent" do
        expect {
          post :create, params: {respondent: valid_attributes}, session: valid_session
        }.to change(Respondent, :count).by(1)
      end

      it "renders a JSON response with the new respondent" do

        post :create, params: {respondent: valid_attributes}, session: valid_session
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new respondent" do

        post :create, params: {respondent: invalid_attributes}, session: valid_session
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { build(:respondent).as_json }

      it "updates the requested respondent" do
        respondent = Respondent.create! valid_attributes
        put :update, params: {id: respondent.to_param, respondent: new_attributes}, session: valid_session
        respondent.reload
        expect(respondent.first_name).to eq(new_attributes["first_name"])
        expect(respondent.last_name).to eq(new_attributes["last_name"])
      end

      it "renders a JSON response with the respondent" do
        respondent = Respondent.create! valid_attributes

        put :update, params: {id: respondent.to_param, respondent: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the respondent" do
        respondent = Respondent.create! valid_attributes

        put :update, params: {id: respondent.to_param, respondent: invalid_attributes}, session: valid_session
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested respondent" do
      respondent = Respondent.create! valid_attributes
      expect {
        delete :destroy, params: {id: respondent.to_param}, session: valid_session
      }.to change(Respondent, :count).by(-1)
    end
  end

end

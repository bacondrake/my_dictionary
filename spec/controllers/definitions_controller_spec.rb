require 'rails_helper'

RSpec.describe DefinitionsController, type: :controller do
	describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the definitions into @definitions" do
      definition1, definition2 = Definition.create!, Definition.create!
      get :index

      expect(assigns(:definitions)).to match_array([definition1, definition2])
    end
  end
end

require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe "GET #index" do
   it "returns success response" do
    url = create(:url)
    get :index
    expect(assigns(:urls)).to include(url)
    expect(response).to have_http_status(:success)
   end
  end

  describe "GET #new" do
    it "returns success response" do
      get :new
      expect(assigns(:url)).to be_a_new(Url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Url and redirects to show" do
        expect {
          post :create, params: { url: { original_url: "https://example.com" } }
        }.to change(Url, :count).by(1)
        expect(response).to redirect_to(Url.last)
      end
    end

    context "with invalid params" do
      it "renders new template again" do
        post :create, params: { url: { original_url: "invalid_url" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "returns success response" do
      url = create(:url)
      get :show, params: { short_code: url.short_code }
      expect(assigns(:url)).to eq(url)
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #redirect" do
    it "creates a click record and increments clicks column" do
      url = create(:url, clicks: 0)
      expect {
        get :redirect, params: { short_code: url.short_code }
      }.to change(Click, :count).by(1)
      url.reload
      expect(url.clicks).to eq(1)
    end
  end
end

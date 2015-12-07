require 'rails_helper'

RSpec.describe "Zprojects", type: :request do
  describe "GET /zprojects" do
    it "works! (now write some real specs)" do
      get zprojects_path
      expect(response).to have_http_status(200)
    end
  end
end

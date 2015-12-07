require 'rails_helper'

RSpec.describe "Ztasks", type: :request do
  describe "GET /ztasks" do
    it "works! (now write some real specs)" do
      get ztasks_path
      expect(response).to have_http_status(200)
    end
  end
end

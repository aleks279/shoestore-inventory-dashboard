require 'rails_helper'

describe 'Dashboards', type: :request do
  describe 'GET /index' do
    it 'renders the dashboard' do
      get root_path
      expect(response).to be_successful
    end
  end
end

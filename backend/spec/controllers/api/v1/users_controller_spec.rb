require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    let!(:user1) { create(:user, name: 'Andrew Simmons') }
    let!(:user2) { create(:user, name: 'Bill Golf') }

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all users in JSON format' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(2)

      expect(parsed_response[0]['name']).to eq('Andrew Simmons')
      expect(parsed_response[1]['name']).to eq('Bill Golf')
    end
  end
end

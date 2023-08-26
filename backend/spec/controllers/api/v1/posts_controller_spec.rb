require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  describe 'GET #index' do
    let!(:post1) { create(:post, title: 'First Post', body: 'This is the first post.') }
    let!(:post2) { create(:post, title: 'Second Post', body: 'This is the second post.') }

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all posts in JSON format' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(2)

      expect(parsed_response[0]['title']).to eq('First Post')
      expect(parsed_response[0]['body']).to eq('This is the first post.')

      expect(parsed_response[1]['title']).to eq('Second Post')
      expect(parsed_response[1]['body']).to eq('This is the second post.')
    end
  end
end

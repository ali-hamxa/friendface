require 'rails_helper'

RSpec.describe Api::V1::LikesController, type: :controller do
  let(:user) { create(:user) }
  let(:likeable) { create(:post) }
  let(:like) { create(:like, user: user, likeable: likeable) }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Like' do
        expect {
          post :create, params: { like: { date: Date.today, user_id: user.id }, likeable_type: 'Post', likeable_id: likeable.id }
        }.to change(Like, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { like: { date: Date.today, user_id: user.id }, likeable_type: 'Post', likeable_id: likeable.id }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Like' do
        expect {
          post :create, params: { like: { date: nil, user_id: nil }, likeable_type: 'Post', likeable_id: likeable.id }
        }.to_not change(Like, :count)
      end

      it 'returns a 422 status code' do
        post :create, params: { like: { date: nil, user_id: nil }, likeable_type: 'Post', likeable_id: likeable.id }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested like' do
      like
      expect {
        delete :destroy, params: { id: like.id }
      }.to change(Like, :count).by(-1)
    end

    it 'returns a 200 status code' do
      delete :destroy, params: { id: like.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #most_liked_days' do
    it 'returns a 200 status code' do
      get :most_liked_days
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #like_streaks' do
    it 'returns a 200 status code' do
      get :like_streaks
      expect(response).to have_http_status(:ok)
    end
  end
end

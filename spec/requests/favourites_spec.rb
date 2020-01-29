# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favourites API', type: :request do
  let!(:property) { create(:property) }
  let!(:user) { create(:user) }
  let(:valid_attributes) { { user_id: user.id, property_id: property.id } }

  describe 'POST /favourites' do
    context 'when the request is valid' do
      before { post '/favourites', params: valid_attributes }

      it 'creates a favourite record' do
        expect(json['users_id']).to eq(valid_attributes[:users_id])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/favourites', params: { user_id: '', property_id: property.id } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: User must exist, User can't be blank\"}")
      end
    end
  end
end

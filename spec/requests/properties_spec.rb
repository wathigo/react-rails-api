# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'properties API' do
  # Initialize the test data
  let!(:category) { create(:category) }
  let!(:properties) { create_list(:property, 20, category_id: category.id) }
  let(:category_id) { category.id }
  let(:id) { properties.first.id }

  # Test suite for GET /categories/:category_id/properties
  describe 'GET /categories/:category_id/properties' do
    before { get "/categories/#{category_id}/properties" }

    context 'when category exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all category properties' do
        expect(json.size).to eq(20)
      end
    end

    context 'when category does not exist' do
      let(:category_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Category with 'id'=#{category_id}\"}")
      end
    end
  end

  # Test suite for GET /categories/:category_id/properties/:id
  describe 'GET /categories/:category_id/properties/:id' do
    before { get "/categories/#{category_id}/properties/#{id}" }

    context 'when category propertyexists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the property' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when category propertydoes not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Property/)
      end
    end
  end

  # Test suite for PUT /categories/:category_id/properties
  describe 'POST /categories/:category_id/properties' do
    let(:valid_attributes) do
      {
        name: 'Visit Narnia',
        address: Faker::Address.full_address,
        price: rand(200_000..1_199_999),
        description: Faker::Lorem.paragraph(sentence_count: 30),
        latt: Faker::Address.latitude,
        long: Faker::Address.longitude,
        category_id: category_id
      }
    end

    context 'when request attributes are valid' do
      before { post "/categories/#{category_id}/properties", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/categories/#{category_id}/properties", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /categories/:category_id/properties/:id
  describe 'PUT /categories/:category_id/properties/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/categories/#{category_id}/properties/#{id}", params: valid_attributes }

    context 'when property exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the property' do
        updated_property = Property.find(id)
        expect(updated_property.name).to match(/Mozart/)
      end
    end

    context 'when the property does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Property/)
      end
    end
  end

  # Test suite for DELETE /categories/:id
  describe 'DELETE /categories/:id' do
    before { delete "/categories/#{category_id}/properties/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

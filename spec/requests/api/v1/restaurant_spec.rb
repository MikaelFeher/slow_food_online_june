require 'rails_helper'

RSpec.describe 'Api::V1::RestaurantsController', type: :request do
  let!(:restaurant_1) {FactoryGirl.create(:restaurant, name: 'Mikey')}
  let!(:restaurant_2) {FactoryGirl.create(:restaurant, name: 'Thomas')}

  describe 'GET /v1/restaurants' do
    it 'should return name of restaurant_1' do
      get '/api/v1/restaurants'
      # json_response = JSON.parse(response.body)
      expect(['restaurants'][0]['name']).to eq 'Mikey'
    end

    it 'should return a list of restaurants' do
      get '/api/v1/restaurants'
      # json_response = JSON.parse(response.body)
      expect(['restaurants'].size).to eq(2)
    end
  end
end

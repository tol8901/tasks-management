require 'rails_helper'
require 'active_support/core_ext/hash/keys'
require "active_support"


RSpec.describe WorkersController do
  describe '#index' do
    it 'returns a success response' do
      get '/workers'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      worker = create :worker
      get '/workers'
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(worker.id.to_s)
        expect(expected[:type]).to eq('worker')
        expect(expected[:attributes]).to eq(
                                           last_name: worker.last_name,
                                           first_name: worker.first_name,
                                           age: worker.age,
                                           role: worker.role,
                                           active: worker.active
                                         )
      end

    end
  end
end
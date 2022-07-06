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
      expect(json.length).to eq(1)
      expected = json.first.deep_symbolize_keys
      aggregate_failures do

        expect(expected).to eq(
                               id: worker.id,
                               last_name: worker.last_name,
                               first_name: worker.first_name,
                               age: worker.age,
                               role: worker.role,
                               active: worker.active,
                               name: worker.first_name + ' ' + worker.last_name
                             )
      end

    end
  end
end
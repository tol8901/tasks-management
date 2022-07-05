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
      expect(json_data).to eq(
        [
          id: worker.id.to_s,
          type: 'worker',
          attributes: {
            last_name: worker.last_name,
            first_name: worker.first_name,
            age: worker.age,
            role: worker.role,
            active: worker.active
          }
        ]
                      )

    end
  end
end
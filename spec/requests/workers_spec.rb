require 'rails_helper'

RSpec.describe WorkersController do
  describe '#index' do
    it 'returns a success response' do
      get '/workers'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      worker = create :worker
      get '/workers'
      body = JSON.parse(response.body)
      expect(body).to eq(
        data: [
          id: worker.id,
          type: 'workers',
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
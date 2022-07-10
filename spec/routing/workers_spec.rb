require 'rails_helper'

RSpec.describe '/workers routes' do
  it 'routes to workers#index' do
    # expect(get '/workers').to route_to(controller: 'workers', action: 'index')
    aggregate_failures do
      expect(get('/workers')).to route_to('workers#index')
      expect(get('/workers?page[number]=3')).to route_to(
        'workers#index', page: { 'number' => '3'}
      )
    end
  end

  it 'routes to workers#show' do
    expect(get('/workers/1')).to route_to('workers#show', id: '1')
  end

end
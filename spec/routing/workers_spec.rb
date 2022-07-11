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

  it 'routes to worker#create' do
    expect(post('/workers')).to route_to('workers#create')
  end

  it 'routes to worker#update' do
    expect(patch('/workers/1')).to route_to(
                                    controller: 'workers',
                                    action: 'update',
                                    id: '1'
                                  )
  end

  it 'routes to worker#destroy' do
    expect(delete '/workers/1').to route_to(
                                     controller: 'workers',
                                     action: 'destroy',
                                     id: '1'
                                   )
  end

  it 'routes to worker#activate' do
    expect(patch '/workers/1/activate').to route_to(
                                             controller: 'workers',
                                             action: 'activate',
                                             id: '1'
                                           )
  end

  it 'routes to worker#deactivate' do
    expect(patch '/workers/1/deactivate').to route_to(
                                               controller: 'workers',
                                               action: 'deactivate',
                                               id: '1'
                                             )
  end
end
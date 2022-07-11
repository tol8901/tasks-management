require 'rails_helper'

RSpec.describe '/tickets routes' do
  it 'routes to tickets#index' do
    aggregate_failures do
      expect(get '/tickets').to route_to('tickets#index')
      expect(get '/tickets?page[number]=3').to route_to('tickets#index', page: { 'number' => '3' })
    end
  end

  it 'routes to ticket#show' do
    expect(get '/tickets/1').to route_to(
                                  controller: 'tickets',
                                  action: 'show',
                                  id: '1'
                                )
  end

  it 'routes to ticket#create' do
    expect(post '/tickets').to route_to('tickets#create')
  end

  it 'routes to ticket#update' do
    expect(patch '/tickets/1').to route_to(
                                    controller: 'tickets',
                                    action: 'update',
                                    id: '1'
                                  )
  end

  it 'routes to ticket#destroy' do
    expect(delete 'tickets/1').to route_to(
                                    controller: 'tickets',
                                    action: 'destroy',
                                    id: '1'
                                  )
  end

  it 'routes to ticket#state' do
    expect(patch '/tickets/1/change_state').to route_to(
                                          controller: 'tickets',
                                          action: 'change_state',
                                          id: '1'
                                        )
  end

  it 'routes to ticket#change_worker' do
    expect(patch 'tickets/1/change_worker').to route_to(
                                                 controller: 'tickets',
                                                 action: 'change_worker',
                                                 id: '1'
                                               )
  end
end
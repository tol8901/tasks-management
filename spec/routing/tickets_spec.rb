require 'rails_helper'

RSpec.describe '/tickets routes' do
  it 'routes to tickets#index' do
    aggregate_failures do
      expect(get '/tickets').to route_to('tickets#index')
      expect(get '/tickets?page[number]=3').to route_to('tickets#index', page: { 'number' => 3 })
    end
  end
end
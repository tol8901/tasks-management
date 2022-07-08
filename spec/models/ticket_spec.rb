require 'rails_helper'
require 'faker'

RSpec.describe Ticket, type: :model do
  describe "#validations" do
    it 'should validate presence of attributes' do
      ticket = build :ticket,
                     title: nil,
                     description: nil,
                     worker: nil,
                     state: nil,
                     worker_name: nil
        expect(ticket).not_to be_valid
        expect(ticket.errors.messages[:title]).to include("can't be blank")
        expect(ticket.errors.messages[:description]).to include("can't be blank")
        expect(ticket.errors.messages[:worker]).to include("can't be blank")
        expect(ticket.errors.messages[:state]).to include("can't be blank")
        expect(ticket.errors.messages[:worker_name]).to include("can't be blank")
      end

    it 'is valid with valid attributes' do
      ticket = build :ticket

      # Restrictions:
      min_str_length = 1
      max_str_length = 40
      states_available = ["Pending", "In progress", "Done"]

      aggregate_failures do
        expect(ticket.title.length).to be_between(min_str_length, max_str_length).inclusive
        expect(states_available).to include(ticket.state)
      end
    end
  end

end

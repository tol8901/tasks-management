require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "#validations" do
    it 'should validate presence of attributes' do
      worker = build :ticket,
                     title: nil,
                     description: nil,
                     worker: nil,
                     state: nil,
                     worker_name: nil
        expect(worker).not_to be_valid
        expect(worker.errors.messages[:title]).to include("can't be blank")
        expect(worker.errors.messages[:description]).to include("can't be blank")
        expect(worker.errors.messages[:worker]).to include("can't be blank")
        expect(worker.errors.messages[:state]).to include("can't be blank")
        expect(worker.errors.messages[:worker_name]).to include("can't be blank")
      end

    # it 'is valid with valid attributes' do
    #   worker = build :worker # , :active => "true"
    #   # Restrictions:
    #   min_str_length = 1
    #   max_str_length = 20
    #   min_age = 16
    #   max_age = 60
    #   roles_available = ["Manager", "Developer", "UI/UX Designer"]
    #   active_states_available = %w[true false]
    #
    #   aggregate_failures do
    #     expect(worker.last_name.length).to be_between(min_str_length, max_str_length).inclusive
    #     expect(worker.first_name.length).to be_between(min_str_length, max_str_length).inclusive
    #     expect(worker.age.to_i).to be_between(min_age, max_age).inclusive
    #     expect(roles_available).to include(worker.role)
    #     expect(active_states_available).to include(worker.active)
    #   end
    # end
  end

end

require 'rails_helper'

RSpec.describe Worker, type: :model do
  describe "#validations" do
    it 'should validate presence of attributes' do
      worker = build :worker,
                     first_name: nil,
                     last_name: nil,
                     age: nil,
                     role: nil,
                     active: nil
      expect(worker).not_to be_valid
      expect(worker.errors.messages[:first_name]).to include("can't be blank")
      expect(worker.errors.messages[:last_name]).to include("can't be blank")
      expect(worker.errors.messages[:age]).to include("can't be blank")
      expect(worker.errors.messages[:role]).to include("can't be blank")
      expect(worker.errors.messages[:active]).to include("can't be blank")
    end

    it 'is valid with valid attributes' do
      worker = build :worker, :active => true
      # Restrictions:
      min_str_length = 1
      max_str_length = 20
      min_age = 16
      max_age = 60
      roles_available = ["Manager", "Developer", "UI/UX Designer"]
      active_states_available = [true, false]

      aggregate_failures do
        expect(worker.last_name.length).to be_between(min_str_length, max_str_length).inclusive
        expect(worker.first_name.length).to be_between(min_str_length, max_str_length).inclusive
        expect(worker.age.to_i).to be_between(min_age, max_age).inclusive
        expect(roles_available).to include(worker.role)

        pp worker.active # TODO: make DB migration change_column
        expect(worker.active).to be_in(active_states_available)
      end
    end
  end
end

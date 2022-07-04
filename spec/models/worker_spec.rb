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
  end

  # describe '#validations' do
  #   let(:workers) { build(:workers) }
  #
  #   it 'tests that factory is valid' do
  #     expect(workers).to be_valid # article.valid? == true
  #   end
  #
  #   it 'has an invalid title' do
  #     workers.first_name = ''
  #     expect(workers).not_to be_valid
  #     expect(workers.errors[:first_name]).to include("can't be blank")
  #   end
  # end
end

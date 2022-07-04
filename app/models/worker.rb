class Worker < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :role, presence: true
  validates :active, presence: true
end

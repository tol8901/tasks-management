class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :worker, presence: true
  validates :state, presence: true
  validates :worker_name, presence: true
end

class Ticket < ApplicationRecord
  validates :title,
            presence: true,
            length: { minimum: 2, maximum: 40}
  validates :description,
            presence: true
  validates :worker,
            presence: true
  validates :state,
            presence: true,
            inclusion: { in: ['Pending', 'In progress', 'Done'],
                         message: "%{value} is not a valid state"}
  validates :worker_name,
            presence: true
end

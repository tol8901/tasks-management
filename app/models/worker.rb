class Worker < ApplicationRecord
  validates :first_name,
            presence: true,
            length: { minimum: 2, maximum: 20}
  validates :last_name,
            presence: true,
            length: { minimum: 2, maximum: 20}
  validates :age,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 16,
                            less_than_or_equal_to: 60
            }
  validates :role,
            presence: true,
            inclusion: { in: ['Manager', 'Developer', 'UI/UX Designer'],
                         message: "%{value} is not a valid role"}
  validates :active,
            presence: true,
            inclusion: { in: ['true', 'false'],
                         message: "%{value} is not valid activity status"
            }
end

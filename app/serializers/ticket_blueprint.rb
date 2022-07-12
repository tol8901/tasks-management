class TicketBlueprint < Blueprinter::Base
  fields :title, :description, :worker_name, :state
  field :created_at, datetime_format: "%m-%d-%Y"
end
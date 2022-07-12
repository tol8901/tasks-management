class WorkerBlueprint < Blueprinter::Base
  fields :id, :first_name, :last_name, :age, :role, :active
  field :name do |worker, options|
    "#{worker.first_name} #{worker.last_name}"
  end
end
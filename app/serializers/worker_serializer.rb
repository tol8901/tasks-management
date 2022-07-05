class WorkerSerializer
  include JSONAPI::Serializer
  attributes :last_name, :first_name, :age, :role, :active
end

class WorkersController < ApplicationController
  def index
    workers = Worker.all
    render json: serializer.new(workers), status: :ok
  end

  def serializer
    WorkerSerializer
  end
end
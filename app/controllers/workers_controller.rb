class WorkersController < ApplicationController
  def index
    workers = Worker.all
    render json: WorkerBlueprint.render(workers), status: :ok
  end

end
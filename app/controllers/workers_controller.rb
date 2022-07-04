class WorkersController < ApplicationController
  def index
    render json: WorkerBlueprint.render(Worker.all)
  end
end
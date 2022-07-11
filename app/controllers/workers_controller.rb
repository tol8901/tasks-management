class WorkersController < ApplicationController
  def index
    workers = Worker.all
    render json: WorkerBlueprint.render(workers), status: :ok
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(params[:worker])#params.require(:worker).permit(:last_name, :first_name, :age, :role, :active))

    if @worker.save
      render json: WorkerBlueprint.render(@worker), status: :created
    else
      render json: WorkerBlueprint.render(@worker.error.full_messages), status: :unprocessable_entity
    end
  end
end
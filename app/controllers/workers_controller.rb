class WorkersController < ApplicationController

  def index
    workers = Worker.all
    render json: WorkerBlueprint.render(workers), status: :ok
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      render json: WorkerBlueprint.render(@worker), status: :created
    else
      render json: WorkerBlueprint.render(@worker.errors.full_messages), status: :unprocessable_entity
    end
  end

  def show
    render json:  WorkerBlueprint.render(@worker, view: :single)
  end

  def update
    if @worker.update(worker_params)
      render json: WorkerBlueprint.render(@worker)
    else
      render json: WorkerBlueprint.render(@worker.errors.full_messages), status: :unprocessable_entity
    end
  end

  def destroy
    @worker.destroy
    render json: WorkerBlueprint.render("#{@worker.first_name} #{@worker.last_name} deleted successfully")
  end

  def activate
    if @worker.activate!
      @worker.update(active: true)
      render json: WorkerBlueprint.render("#{@worker.first_name} #{@worker.last_name} activated")
    else
      render json: WorkerBlueprint.render("#{@worker.first_name} #{@worker.last_name} already activated")
    end
  end

  def deactivate
    if @worker.deactivate!
      render json: WorkerBlueprint.render("#{@worker.first_name} #{@worker.last_name} already deactivated")
    else
      @worker.update(active: false)
      render json: WorkerBlueprint.render("#{@worker.first_name} #{@worker.last_name} deactivated")
    end
  end

  private

  def find
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:last_name, :first_name, :age, :role, :active)
  end
end
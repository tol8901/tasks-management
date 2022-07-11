class TicketsController < ApplicationController
  before_action :find, except: [:index, :create]

  def index
    tickets = Ticket.all
    render json: WorkerBlueprint.render(tickets), status: :ok
  end

  def create
    ticket = Ticket.new(create_params)
    if ticket.save
      render json: WorkerBlueprint.render(ticket), status: :created
    else
      render json: WorkerBlueprint.render(ticket.errors.full_messages), status: :expectation_failed
    end
  end

  def show
    render json: WorkerBlueprint.render(@ticket)
  end

  def update
    if @ticket.update(update_params)
      render json: WorkerBlueprint.render(@ticket)
    else
      render json: WorkerBlueprint.render(@ticket.errors.full_messages), status: :bad_request
    end
  end

  def destroy
    @ticket.destroy
    render json: WorkerBlueprint.render("#{@ticket} deleted successfully")
  end

  def change_state # Change a state of the ticket
    if @ticket.update(state: params[:state])
      render json: WorkerBlueprint.render(@ticket)
    else
      render json: WorkerBlueprint.render(@ticket.errors.full_messages)
    end
  end

  def change_worker
    if @ticket.update(worker_id: params[:worker_id])
      render json: WorkerBlueprint.render(@ticket)
    else
      render json: WorkerBlueprint.render(@ticket.errors.full_messages)
    end
  end

  private

  def find
    @ticket = Ticket.find(params[:id])
  end

  def create_params
    params.require(:data).permit(:title, :worker_id, :description, :state)
  end

  def update_params
    params.require(:data).permit(:title, :description)
  end
end
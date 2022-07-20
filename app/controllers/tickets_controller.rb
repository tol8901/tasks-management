class TicketsController < ApplicationController
  before_action :find, except: [:index, :create]
  before_action :authenticate_user!

  def index
    tickets = Ticket.all
    render json: TicketBlueprint.render(tickets), status: :ok
  end

  def create
    ticket = Ticket.new(create_params)
    if ticket.save
      render json: TicketBlueprint.render(ticket), status: :created
    else
      render json: TicketBlueprint.render(ticket.errors.full_messages), status: :expectation_failed
    end
  end

  def show
    render json: TicketBlueprint.render(@ticket)
  end

  def update
    if @ticket.update(update_params)
      render json: TicketBlueprint.render(@ticket)
    else
      render json: TicketBlueprint.render(@ticket.errors.full_messages), status: :bad_request
    end
  end

  def destroy
    @ticket.destroy
    render json: TicketBlueprint.render("#{@ticket} deleted successfully")
  end

  def change_state # Change a state of the ticket
    if @ticket.update(state: params[:state])
      render json: TicketBlueprint.render(@ticket)
    else
      render json: TicketBlueprint.render(@ticket.errors.full_messages)
    end
  end

  def change_worker
    if @ticket.update(worker_id: params[:worker_id])
      render json: TicketBlueprint.render(@ticket)
    else
      render json: TicketBlueprint.render(@ticket.errors.full_messages)
    end
  end

  private

  def find
    @ticket = Ticket.find(params[:id])
  end

  def create_params
    params.require(:ticket).permit(:title, :worker, :description, :state, :worker_name)
  end

  def update_params
    params.require(:data).permit(:title, :description)
  end
end
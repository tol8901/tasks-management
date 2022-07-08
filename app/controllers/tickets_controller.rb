class TicketsController < ApplicationController
  def index
    tickets = Ticket.all
    render json: WorkerBlueprint.render(tickets), status: :ok
  end
end
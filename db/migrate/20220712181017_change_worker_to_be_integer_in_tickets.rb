class ChangeWorkerToBeIntegerInTickets < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :worker, 'integer USING CAST(worker AS integer)'
  end
end

class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :worker
      t.string :state
      t.string :worker_name

      t.timestamps
    end
  end
end

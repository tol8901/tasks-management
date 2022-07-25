class AddWorkerIdToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :worker, foreign_key: true
  end
end

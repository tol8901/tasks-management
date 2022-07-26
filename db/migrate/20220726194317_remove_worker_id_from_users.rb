class RemoveWorkerIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :worker_id
  end
end

class ChangeActiveToBeBooleanInWorkers < ActiveRecord::Migration[7.0]
  def change
    change_column :workers, :active, 'boolean USING CAST(active AS boolean)'
  end
end

class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :last_name
      t.string :first_name
      t.string :age
      t.string :role
      t.string :active

      t.timestamps
    end
  end
end

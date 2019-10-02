class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.integer :opportunity_id
      t.integer :volunteer_id
      t.integer :position

      t.timestamps
    end

    add_index :assignments, [:opportunity_id, :volunteer_id]
  end
end

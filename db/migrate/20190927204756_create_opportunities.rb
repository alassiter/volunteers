class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class AddNumberOfVolsToOpportunity < ActiveRecord::Migration[6.0]
  def change
    add_column :opportunities, :volunteers_needed, :integer
  end
end

class AddToolsAndSkillsToOpportunity < ActiveRecord::Migration[6.0]
  def change
    add_column :opportunities, :tools_needed, :text
    add_column :opportunities, :skills_needed, :text
  end
end

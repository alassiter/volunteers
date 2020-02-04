class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :opportunity_id
      t.string :caption
      t.string :photographer
      t.text :image_data

      t.timestamps
    end
  end
end

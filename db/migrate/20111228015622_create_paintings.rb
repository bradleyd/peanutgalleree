class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string  :name
      t.string  :description
      t.integer :image_size
      t.string  :image_type

      t.timestamps
    end
  end
end

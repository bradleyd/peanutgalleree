class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :user_id
      t.integer :painting_id

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.integer :painting_id
      t.text :body

      t.timestamps
    end
  end
end

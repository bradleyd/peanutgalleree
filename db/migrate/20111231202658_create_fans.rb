class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.integer :user_id
      t.integer :follower_id
      t.boolean :authorized, :default => false

      t.timestamps
    end
      add_index :fans, [:user_id, :follower_id]
  end
end

class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.integer :follower_id, null: false, foreign_key: { to_table: :users }
      t.integer :followee_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

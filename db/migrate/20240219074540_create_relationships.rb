class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # 下記の複合インデックスキーは，2つの要素の組み合わせが重複しない保証する仕組み
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end

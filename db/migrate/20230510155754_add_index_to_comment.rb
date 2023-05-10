class AddIndexToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post_id, :integer
    add_index :comments, :post_id
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end
end

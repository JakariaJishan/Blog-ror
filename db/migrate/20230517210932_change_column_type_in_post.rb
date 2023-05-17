class ChangeColumnTypeInPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :comments_counter, 'integer USING comments_counter::integer'
    change_column :posts, :likes_counter, 'integer USING likes_counter::integer'

  end
end

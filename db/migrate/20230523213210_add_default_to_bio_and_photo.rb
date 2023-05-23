class AddDefaultToBioAndPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :bio, :text, default: 'this is a demo text'
    change_column :users, :photo, :string, default: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=374&q=80'

  end
end

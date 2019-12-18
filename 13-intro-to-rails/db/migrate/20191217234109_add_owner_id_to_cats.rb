class AddOwnerIdToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :owner_id, :integer
  end
end

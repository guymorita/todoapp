class AddStatus < ActiveRecord::Migration
  def up
    add_column :todos, :status, :boolean, :default => false
  end

  def down
    remove_column :todos, :status
  end
end

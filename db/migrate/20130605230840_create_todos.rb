class CreateTodos < ActiveRecord::Migration
  def up
    create_table :todos do |t|
      t.string :name
      t.string :description
      t.string :owner
    end
  end

  def down
    drop_table :todos
  end
end

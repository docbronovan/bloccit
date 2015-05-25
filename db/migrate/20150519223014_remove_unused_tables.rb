class RemoveUnusedTables < ActiveRecord::Migration
  def change
    drop_table :answers
    drop_table :questions
  end
end

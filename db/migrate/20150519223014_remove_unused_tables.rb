class RemoveUnusedTables < ActiveRecord::Migration
  def change
    drop_table :questions
    drop_table :answers
  end
end

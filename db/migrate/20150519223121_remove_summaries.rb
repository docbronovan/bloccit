class RemoveSummaries < ActiveRecord::Migration
  def change
    drop_table :summaries
  end
end

class RemoveDateAndTimeFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :date_and_time, :datetime
  end
end

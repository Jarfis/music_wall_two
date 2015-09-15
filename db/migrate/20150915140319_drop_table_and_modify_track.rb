class DropTableAndModifyTrack < ActiveRecord::Migration
  def change
    drop_table :user_tracks

    add_reference :tracks, :user
  end
end

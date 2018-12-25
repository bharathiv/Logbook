class CreateTrackRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :track_records do |t|
      t.string :description
      t.string :track_for
      t.string :created_by

      t.timestamps
    end
  end
end

class CreateStudyRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :study_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :drill, null: false, foreign_key: true
      t.integer :score
      t.integer :taken_seconds

      t.timestamps
    end
  end
end

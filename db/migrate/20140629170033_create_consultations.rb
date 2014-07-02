class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.text :description
      t.references :user, index: true
      t.references :course, index: true
      t.datetime :date

      t.timestamps
    end
  end
end

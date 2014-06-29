class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :description
      t.references :user, index: true
      t.references :course, index: true
      t.datetime :date

      t.timestamps
    end
  end
end

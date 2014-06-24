class CreateAdvertisingsTags < ActiveRecord::Migration
  def change
    create_table :advertisings_tags, id: false do |t|
      t.belongs_to :advertising
      t.belongs_to :tag
    end
  end
end

class AddImageToAdvertisings < ActiveRecord::Migration
  def change
    add_column :advertisings, :image, :string
  end
end

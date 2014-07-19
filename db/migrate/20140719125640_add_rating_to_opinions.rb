class AddRatingToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :rating, :integer
  end
end

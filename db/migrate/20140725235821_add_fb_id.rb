class AddFbId < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :integer, :limit => 8, :null => false, :default => 0
  end
end

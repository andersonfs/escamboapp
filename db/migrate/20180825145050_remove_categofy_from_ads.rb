class RemoveCategofyFromAds < ActiveRecord::Migration
  def change
    remove_column :ads, :categofy
  end
end

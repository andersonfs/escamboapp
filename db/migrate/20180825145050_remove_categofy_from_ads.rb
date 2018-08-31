class RemoveCategofyFromAds < ActiveRecord::Migration[5.2]
  def change
    remove_column :ads, :categofy
  end
end

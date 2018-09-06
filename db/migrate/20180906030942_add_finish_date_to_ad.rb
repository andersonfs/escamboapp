class AddFinishDateToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :finish_date, :date
  end
end

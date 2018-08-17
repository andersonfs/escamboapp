# frozen_string_literal: true

class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title, limit: 255
      t.text :description
      t.references :categofy, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description, limit: 60

      t.timestamps
    end
  end
end

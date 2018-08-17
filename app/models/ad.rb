# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :categofy
  belongs_to :member
end

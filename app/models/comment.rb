class Comment < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :ad
end
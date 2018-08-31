# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # Scopes
  scope :last_six, -> { limit(6).order(created_at: :desc) }

  scope :random, ->(quantity) {
    if Rails.env.production?
      limit(quantity).order("RAND()") # MySQL
    else
      limit(quantity).order("RANDOM()") # SQLite
    end
  }

  # gem money-rails
  monetize :price_cents

  # gem PaperClip
  has_attached_file :picture, styles: { large: "800x300#", medium: "250x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"  
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
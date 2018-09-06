# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # Validates
  validates :title, :description, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scopes
  scope :descending_order, ->(quantity = 12) { limit(quantity).order(created_at: :desc) }
  scope :to_the, -> (member) { where(member: member) }

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
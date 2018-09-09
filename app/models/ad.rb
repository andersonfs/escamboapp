# frozen_string_literal: true

class Ad < ApplicationRecord

  # Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :category, counter_cache: true
  belongs_to :member

  # Validates
  validates :title, :description_md, :description_short, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scopes
  scope :descending_order, ->(quantity = 12) { limit(quantity).order(created_at: :desc) }
  scope :to_the, -> (member) { where(member: member) }
  scope :where_category, -> (id) { where(category: id) }

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

  private

    def md_to_html
      options = {
          filter_html: true,
          link_attributes: {
              rel: "nofollow",
              target: "_blank"
          }
      }

      extensions = {
          space_after_headers: true,
          autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
      self.description = markdown.render(self.description_md)
    end

end
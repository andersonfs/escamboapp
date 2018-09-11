# frozen_string_literal: true

class Ad < ApplicationRecord

  # Constants
  QTT_PER_PAGE = 6

  # RatyRate Gem
  ratyrate_rateable 'quality'

  # Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :category, counter_cache: true
  belongs_to :member

  has_many :comments

  # Validates
  validates :title, :description_md, :description_short, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scopes
  scope :descending_order, ->(page) do
    order(created_at: :desc).page(page).per(QTT_PER_PAGE)
  end

  scope :search, -> (term, page) do
    where("lower(title) LIKE ?", "%#{term.downcase}%").page(page).per(QTT_PER_PAGE)
  end

  scope :by_category, -> (id, page) do
    where(category: id).page(page).per(QTT_PER_PAGE)
  end

  scope :random, ->(quantity) {
    if Rails.env.production?
      limit(quantity).order("RAND()") # MySQL
    else
      limit(quantity).order("RANDOM()") # SQLite
    end
  }

  scope :to_the, -> (member) { where(member: member) }
  # Scopes

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
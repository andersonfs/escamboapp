# frozen_string_literal: true

class Site::HomeController < SiteController

  def index
    @categories = Category.order_by_description
    @ads = Ad.descending_order(15)
    @carousel = Ad.random(3)
  end
end
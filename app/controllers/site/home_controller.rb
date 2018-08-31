# frozen_string_literal: true

class Site::HomeController < SiteController

  def index
    @categories = Category.order_by_description
    @ads = Ad.last_six
    @carousel = Ad.random(3)
  end
end
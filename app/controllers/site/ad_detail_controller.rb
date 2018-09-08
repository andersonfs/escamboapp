class Site::AdDetailController < SiteController

  def show
    @ad = Ad.find(params[:id])
    @categories = Category.order_by_description
  end
end

class Site::SearchController < SiteController

  def ads
    cookies[:search_term] = params[:q]
    # @ads = Ad.search(params[:q], params[:page])
    @ads = Ad.search(params[:q], fields: [:title], page:  params[:page], per_page: Ad::QTT_PER_PAGE)
    @categories = Category.order_by_description
    cookies[:categories] = { value: @categories.to_json, expires: 1.hour.from_now }
  end
end

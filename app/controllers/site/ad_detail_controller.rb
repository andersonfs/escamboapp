class Site::AdDetailController < SiteController

  def show
    @ad = Ad.find(params[:id])
    @categories = Category.order_by_description

    #respond_to do |format|
    #  format.html # views html.erb
    #  format.json { render json: @ad }
    #  format.xml { render xml: @ad }
    #end
  end
end

class Site::AdDetailController < SiteController

  def show
    @ad = Ad.find(params[:id])
    @categories = Category.order_by_description

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "ad_detail",
        layout: 'pdf'
      end
    #  format.json { render json: @ad }
    #  format.xml { render xml: @ad }
    end
  end
end

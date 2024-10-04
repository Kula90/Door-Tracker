class DeliveredDeliveriesController < ApplicationController
  before_action :set_construction_site
  before_action :set_delivered_delivery, only: [:edit, :update, :destroy]

  def index
    @delivered_deliveries = @construction_site.delivered_deliveries

    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @delivered_deliveries = @delivered_deliveries
        .where("number_of_doors LIKE ? OR delivery_date LIKE ? OR strftime('%H:%M', delivery_time) LIKE ?", search_query, search_query, search_query)
    end

    if params[:sort].present? && params[:direction].present?
      @delivered_deliveries = @delivered_deliveries.order("#{sort_column} #{sort_direction}")
    else
      @delivered_deliveries = @delivered_deliveries.order("delivery_date ASC")
    end

    @delivered_deliveries = @delivered_deliveries.page(params[:page]).per(10)
  end

  def new
    @delivered_delivery = @construction_site.delivered_deliveries.new
  end

  def create
    @delivered_delivery = @construction_site.delivered_deliveries.new(delivery_params)
    @delivered_delivery.submitted_at = Time.current

    if @delivered_delivery.save
      requested_delivery = @construction_site.requested_deliveries.find_by(delivery_date: @delivered_delivery.delivery_date, delivery_time: @delivered_delivery.delivery_time)
      if requested_delivery
        requested_delivery.update(status: "completed")
      end

      redirect_to construction_site_delivered_deliveries_path(@construction_site)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @delivered_delivery.update(delivery_params)
      redirect_to construction_site_delivered_deliveries_path(@construction_site)
    else
      render :edit
    end
  end

  def destroy
    @delivered_delivery.destroy
  
    respond_to do |format|
      format.html { redirect_to construction_site_delivered_deliveries_path(@construction_site), notice: 'Delivered delivery was successfully deleted.' }
      format.json { head :no_content } # Handle JSON response for JS
    end
  end
  

  private

  def set_construction_site
    @construction_site = ConstructionSite.find(params[:construction_site_id])
  end

  def set_delivered_delivery
    @delivered_delivery = @construction_site.delivered_deliveries.find(params[:id])
  end

  def delivery_params
    params.require(:delivered_delivery).permit(:number_of_doors, :delivery_date, :delivery_time)
  end

  def sort_column
    case params[:sort]
    when "number_of_doors"
      "number_of_doors"
    when "delivery_date"
      "delivery_date"
    when "delivery_time"
      "delivery_time"
    else
      "delivery_date"  # Default sort by delivery date
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : nil
  end
end

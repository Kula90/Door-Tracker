class RequestedDeliveriesController < ApplicationController
  before_action :set_construction_site
  before_action :set_requested_delivery, only: [:edit, :update, :destroy, :mark_as_delivered]

  def index
    @requested_deliveries = @construction_site.requested_deliveries

    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @requested_deliveries = @requested_deliveries
        .where("number_of_doors LIKE ? OR delivery_date LIKE ? OR strftime('%H:%M', delivery_time) LIKE ?", search_query, search_query, search_query)
    end

    if params[:sort].present? && params[:direction].present?
      @requested_deliveries = @requested_deliveries.order("#{sort_column} #{sort_direction}")
    else
      @requested_deliveries = @requested_deliveries.order("delivery_date ASC")
    end

    @requested_deliveries = @requested_deliveries.page(params[:page]).per(10)
  end

  def new
    @requested_delivery = @construction_site.requested_deliveries.new
  end

  def create
    @requested_delivery = @construction_site.requested_deliveries.new(requested_delivery_params)
    @requested_delivery.submitted_at = Time.current

    if @requested_delivery.save
      redirect_to construction_site_requested_deliveries_path(@construction_site)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @requested_delivery.update(requested_delivery_params)
      redirect_to construction_site_requested_deliveries_path(@construction_site)
    else
      render :edit
    end
  end

  def destroy
    @requested_delivery.destroy
  
    respond_to do |format|
      format.html { redirect_to construction_site_requested_deliveries_path(@construction_site), notice: 'Requested delivery was successfully deleted.' }
      format.json { head :no_content } # Handle JSON response for JS
    end
  end
  

  private

  def set_construction_site
    @construction_site = ConstructionSite.find(params[:construction_site_id])
  end

  def set_requested_delivery
    @requested_delivery = @construction_site.requested_deliveries.find_by(id: params[:id])
  end

  def requested_delivery_params
    params.require(:requested_delivery).permit(:number_of_doors, :delivery_date, :delivery_time)
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
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

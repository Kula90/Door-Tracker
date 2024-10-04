class ConstructionSitesController < ApplicationController
  before_action :set_construction_site, only: [:show, :edit, :update, :destroy]

  def index
    # Order the construction sites by creation date, newest first
    @construction_sites = ConstructionSite.order(created_at: :desc)
  end

  def show
    @requested_deliveries = @construction_site.requested_deliveries
    @delivered_deliveries = @construction_site.delivered_deliveries
    @door_installations = @construction_site.door_installations
  end

  def new
    @construction_site = ConstructionSite.new
  end

  def create
    @construction_site = ConstructionSite.new(construction_site_params)
    if @construction_site.save
      redirect_to construction_sites_path, notice: 'Construction site was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @construction_site.update(construction_site_params)
      redirect_to construction_sites_path, notice: 'Construction site was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @construction_site.destroy
    redirect_to construction_sites_url, notice: 'Construction site was successfully deleted.'
  end

  private

  def set_construction_site
    @construction_site = ConstructionSite.find(params[:id])
  end

  def construction_site_params
    params.require(:construction_site).permit(:name, :address, :floors)
  end
end

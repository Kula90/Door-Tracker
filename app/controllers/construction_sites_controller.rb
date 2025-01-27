# app/controllers/construction_sites_controller.rb
class ConstructionSitesController < ApplicationController
  before_action :set_construction_site, only: [:show, :edit, :update, :destroy]

  def index
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
  
    respond_to do |format|
      if @construction_site.save
        format.html { redirect_to construction_sites_path, notice: 'Construction site was successfully created.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('construction_site_form', partial: 'construction_sites/form', locals: { construction_site: @construction_site }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  
  def edit
  end

  def update
    respond_to do |format|
      if @construction_site.update(construction_site_params)
        format.html { redirect_to construction_sites_path, notice: 'Construction site was successfully updated.' }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('construction_site_form', partial: 'construction_sites/form', locals: { construction_site: @construction_site }) }
        format.html { render :edit, status: :unprocessable_entity }
      end
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

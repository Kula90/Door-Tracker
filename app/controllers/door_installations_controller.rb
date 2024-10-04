class DoorInstallationsController < ApplicationController
  before_action :set_construction_site
  before_action :set_door_installation, only: [:edit, :update, :destroy]

  def index
    @door_installations = @construction_site.door_installations

    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @door_installations = @door_installations
        .where("LOWER(block) LIKE ? OR CAST(floor AS TEXT) LIKE ? OR CAST(number_of_doors AS TEXT) LIKE ? OR CAST(installation_date AS TEXT) LIKE ? OR CAST(installation_time AS TEXT) LIKE ?", 
              query, query, query, query, query)
    end

    if params[:sort].present? && params[:direction].present?
      @door_installations = @door_installations.order("#{sort_column} #{sort_direction}")
    else
      @door_installations = @door_installations.order("installation_date ASC")
    end

    @door_installations = @door_installations.page(params[:page]).per(10)
  end

  def new
    @door_installation = @construction_site.door_installations.new
  end

  def create
    @door_installation = @construction_site.door_installations.new(door_installation_params)
    @door_installation.submitted_at = Time.current

    if @door_installation.save
      redirect_to construction_site_door_installations_path(@construction_site)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @door_installation.update(door_installation_params)
      redirect_to construction_site_door_installations_path(@construction_site)
    else
      render :edit
    end
  end

  def destroy
    @door_installation.destroy
  
    respond_to do |format|
      format.html { redirect_to construction_site_door_installations_path(@construction_site), notice: 'Door installation was successfully deleted.' }
      format.json { head :no_content } # This will handle the JS/AJAX request
    end
  end
  

  private

  def set_construction_site
    @construction_site = ConstructionSite.find(params[:construction_site_id])
  end

  def set_door_installation
    @door_installation = @construction_site.door_installations.find(params[:id])
  end

  def door_installation_params
    params.require(:door_installation).permit(:number_of_doors, :floor, :installation_date, :installation_time, :block)
  end

  def sort_column
    case params[:sort]
    when "block"
      "block"
    when "floor"
      "floor"
    when "number_of_doors"
      "number_of_doors"
    when "installation_date"
      "installation_date"
    when "installation_time"
      "installation_time"
    else
      "installation_date"  # Default sort by installation date
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

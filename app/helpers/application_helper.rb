module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = if params[:sort] == column
                  params[:direction] == "asc" ? "desc" : (params[:direction] == "desc" ? nil : "asc")
                else
                  "asc"
                end
    link_to title, { sort: column, direction: direction }
  end
end

  def back_path
    if ["edit", "new", "create", "update"].include?(action_name)
      # On edit or new actions, return to the relevant index (table) page
      case controller_name
      when "door_installations"
        construction_site_door_installations_path(@construction_site)
      when "delivered_deliveries"
        construction_site_delivered_deliveries_path(@construction_site)
      when "requested_deliveries"
        construction_site_requested_deliveries_path(@construction_site)
      else
        root_path # Fallback to the root path if no match is found
      end
    else
      # On index actions, return to the homepage
      construction_sites_path
    end
  end
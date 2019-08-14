class VariationsController < ChouetteController

  defaults :resource_class => Chouette::Variations
  respond_to :html
  belongs_to :referential

  def import_service
    ImportService.new(@referential)
  end

  def show
    build_breadcrumb :show
    @import ||= import_service.find( params[:id] )
    if params[:id]
      @variations = Chouette::Variations.where(:jobv => params[:id])
    else
      @variations = Chouette::Variations.all;
    end
  end
end

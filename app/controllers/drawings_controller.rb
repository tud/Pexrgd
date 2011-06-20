class DrawingsController < InheritedResources::Base
  respond_to :js, :json
  
  autocomplete :drawing, :number,   :full => true, :scopes => [:distinct_designer]
  autocomplete :drawing, :rev,                     :scopes => [:distinct_designer]
  autocomplete :drawing, :format,                  :scopes => [:distinct_format]
  autocomplete :drawing, :descr,                   :scopes => [:distinct_descr]
  autocomplete :drawing, :designer, :full => true, :scopes => [:distinct_designer]
  
  def index
    @columns = ['id','number','rev','format','descr','designer']
    search_result = Drawing.search(params[:q])
    @drawings = search_result.result(:distinct => true).paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))

    respond_to do |format|
      format.js
      format.json { render :json => json_for_jqgrid(@drawings, @columns) }
    end
  end

  def search
    @q = Drawing.search(params[:q])
  end
  
  def jqgrid
    @q = params
  end
end

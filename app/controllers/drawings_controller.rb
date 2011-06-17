class DrawingsController < InheritedResources::Base
  respond_to :js, :json
  
  autocomplete :drawing, :number, :full => true, :scopes => [:distinct_designer]
  autocomplete :drawing, :rev, :scopes => [:distinct_designer]
  autocomplete :drawing, :format, :scopes => [:distinct_format]
  autocomplete :drawing, :descr, :scopes => [:distinct_descr]
  autocomplete :drawing, :designer, :full => true, :scopes => [:distinct_designer]
  
  def index
    @qq = Drawing.search(params[:q])
    @drawings = @qq.result(:distinct => true)

    @jqgrid = Hash.new
    @jqgrid[:total] = 1
    @jqgrid[:page] = 1
    @jqgrid[:records] = @drawings.length
    @jqgrid[:rows] = @drawings.collect{|u| {
      :id => u.id,
      :cell => [
        u.id,
        u.number,
        u.rev,
        u.format,
        u.descr,
        u.designer
     ]}}
    respond_to do |format|
      format.js
      format.json { render :json => @jqgrid }
    end
  end

  def search
    @q = Drawing.search(params[:q])
  end
  
  def jqgrid
    @q = params
  end
end

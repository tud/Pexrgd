module DrawingsHelper
  include JqgridsHelper

  def drawings_jqgrid
    grid = [{
      :url => drawings_path + ".json?" + @q.to_param,
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => ['Id','Number','Rev','Format','Description','Designer'],
      :colModel  => [
        {:name => 'id',       :index => 'id',       :width => 20,  :hidden => true}, 
        {:name => 'number',   :index => 'number',   :width => 100}, 
        {:name => 'rev',      :index => 'rev',      :width => 30}, 
        {:name => 'format',   :index => 'format',   :width => 25}, 
        {:name => 'descr',    :index => 'descr',    :width => 120}, 
        {:name => 'designer', :index => 'designer', :width => 40} 
      ],
      :pager => '#drawings_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30, 50],
      :sortname => 'number',
      :sortorder => 'desc',
      :caption => 'Drawings',
      :height => 'auto',
      :autowidth => true,
      :onSelectRow => "function() { alert('Row selected!');}".to_json_var
    }]

    jqgrid_api 'drawings_list', grid
  end

end

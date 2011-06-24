module DrawingsHelper
  include JqgridsHelper

  def drawings_jqgrid

    options = {:on_document_ready => true, :html_tags => false}

    grid = [{
      :url => drawings_path + ".json?" + @q.to_param,
      :datatype => 'json',
      :mtype    => 'GET',
      :colNames => ['Id','Number','Rev','Format','Description','Designer'],
      :colModel => [
        {:name => 'id',       :index => 'id',       :width => 20 }, 
        {:name => 'number',   :index => 'number',   :width => 100 }, 
        {:name => 'rev',      :index => 'rev',      :width => 30  }, 
        {:name => 'format',   :index => 'format',   :width => 25  }, 
        {:name => 'descr',    :index => 'descr',    :width => 120 }, 
        {:name => 'designer', :index => 'designer', :width => 40  } 
      ],
      :pager       => '#drawings_pager',
      :rowNum      => 10,
      :rowList     => [10, 20, 30, 50],
      :sortname    => 'number',
      :sortorder   => 'desc',
      :caption     => 'Drawings',
      :height      => 'auto',
      :viewrecords => true,
      :onSelectRow => "function() { alert('Row selected!');}".to_json_var
    }]
#      :gridComplete => 'function(){ var ids = $(\'#drawings_jqgrid\').jqGrid(\'getDataIds\'); for (var ii=0;ii<ids.length;++ii) { var cell = ids[ii]; var edit_btn = \'<input type=button value=E />\'; $(\'#drawings_jqgrid\').jqGrid(\'setRowData\', ids[ii], {\'action\': edit_btn}); } }'.to_json_var,

    pager = [:navGrid, "#drawings_pager", {}, {}, {}, {:closeOnEscape => true}]

    # pager_button = [:navButtonAdd, "#drawings_pager", {:caption => 'Add', :onClickButton => 'function() {alert("Custom button!")}'.to_json_var }]
    

    #jqgrid_api 'drawings_list', grid, pager, pager_button, options
    jqgrid_api 'drawings_list', grid, pager, options
  end

end

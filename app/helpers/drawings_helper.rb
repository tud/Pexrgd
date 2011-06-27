module DrawingsHelper
  include JqgridsHelper

  def drawings_jqgrid

    options = {:on_document_ready => true, :html_tags => false}

        # {:name => 'S',    :width => 10, :formatter => 'showlink', :formatoptions => {:baseLinkUrl => url_for(drawings_path) + '/show' }}, 
    grid = [{
      :url => drawings_path + ".json?" + @q.to_param,
      :datatype => 'json',
      :mtype    => 'GET',
      :colNames => ['Id','','Number','Rev','Format','Description','Designer'],
      :colModel => [
        {:name => 'id',       :index => 'id',       :width => 20 , :hidden => true}, 
        {:name => 'action',    :width => 7}, 
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
      :viewrecords => true
    }]

    pager = [:navGrid, "#drawings_pager", {add:false,edit:false,search:false,del:false,refresh:false}, {}, {}, {:closeOnEscape => true}]

    # pager_button = [:navButtonAdd, "#drawings_pager", {:caption => 'Add', :onClickButton => 'function() {alert("Custom button!")}'.to_json_var }]
    

    #jqgrid_api 'drawings_list', grid, pager, pager_button, options
    jqgrid_api 'drawings_list', grid, pager, options
  end

end

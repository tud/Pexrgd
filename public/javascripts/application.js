var pexlayout;

$(function() {
	var container = $('body');
	pexlayout = container.height(container.height()).layout({
		applyDefaultStyles: true
		, north__size: '80'
		, west__onresize: function () {
			$('#west_accordion').accordion('resize');
		}
		, east__onresize: function () {
			$('#east_accordion').accordion('resize');
		}
		, center__onresize: function () {
			$('#center_accordion').accordion('resize');
			var centerWidth = pexlayout.cssWidth('center');
			$('#drawings_list').setGridWidth(centerWidth-60);
		}
		, spacing_open: 2
		, spacing_close: 5
	});

	$("#west_accordion").accordion({
		fillSpace: true
		, navigation: true
	});

	$("#east_accordion").accordion({
		fillSpace: true
		, navigation: true
	});

	$("#center_accordion").accordion({
		fillSpace: true
		, navigation: true
	});
});

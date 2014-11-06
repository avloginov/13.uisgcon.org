defaults =
	navigation : true
	slideSpeed : 300
	singleItem: true
	autoHeight : true
	pagination : off
	navigationText: off
	theme : "owl-jumbotron"
	rewindNav: off

$.fn.initJumbotron = ->
	@each ->
		params = $.extend {}, defaults

		if $(@).hasClass "jumbotron_nav"
			params.pagination = on
			params.theme = "owl-jumbotron-nav"

		$(@).owlCarousel params

$(".jumbotron").initJumbotron()
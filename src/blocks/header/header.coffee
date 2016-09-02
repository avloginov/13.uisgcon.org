$ ->
	$block = $("#header")
	$window = $(window)
	preakpoint = $block.offset().top

	stickyHeader = (event) ->
		scrollTop = $(window).scrollTop()

		if scrollTop >= preakpoint and not $block.hasClass("header_fixed")
			$block.addClass("header_fixed")
		else if scrollTop <= preakpoint and $block.hasClass("header_fixed")
			$block.removeClass("header_fixed")

	$window.on("scroll", throttle(stickyHeader, 100))

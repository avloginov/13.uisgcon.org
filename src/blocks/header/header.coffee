$ ->
	$block = $("#header")
	return unless $block.length
	$window = $(window)
	preakpoint = $block.offset().top
	$menuToggle = $block.find(".header__toggle")
	$tooltip = $block.find(".header__tooltip")


	stickyHeader = (event) ->
		scrollTop = $(window).scrollTop()

		if scrollTop >= preakpoint and not $block.hasClass("header_fixed")
			$block.addClass("header_fixed")
		else if scrollTop <= preakpoint and $block.hasClass("header_fixed")
			$block.removeClass("header_fixed")

	menuToggle = (event) ->
		$this = $(@)
		$this.closest(".header").toggleClass("menu-open")

	manageTooltip = (event) ->
		if not $tooltip.is(event.target) and $tooltip.has(event.target).length is 0
			$tooltip.removeClass("active")
		else
			$tooltip.addClass("active")

	closeMenuOnResize = ->
		if window.innerWidth > 1000 and $block.hasClass("menu-open")
			$block.removeClass("menu-open")

	$window.on("scroll", stickyHeader)
	$window.on("resize", closeMenuOnResize)

	$menuToggle.on("click", menuToggle)
	$(document).on("touchstart", manageTooltip)

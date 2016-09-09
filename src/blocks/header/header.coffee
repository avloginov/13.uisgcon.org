$ ->
	$block = $(".header")
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
		# $this = $(@)
		$block.toggleClass("menu-open")

	manageTooltip = (event) ->
		$this = $(event.target)
		if not $tooltip.is($this) and not $tooltip.has($this).length
			$tooltip.removeClass("active")
		else
			$tooltip.addClass("active")

	manageMenu = (event) ->
		$this = $(event.target)
		if not $this.closest(".header__content").length and not $this.is($menuToggle)
			$block.removeClass("menu-open")

	closeMenuOnResize = ->
		if window.innerWidth > 1000 and $block.hasClass("menu-open")
			$block.removeClass("menu-open")

	$window.on("scroll", stickyHeader)
	$window.on("resize", closeMenuOnResize)

	$menuToggle.on("click", menuToggle)
	$(document).on("click", manageMenu)
	$(document).on("touchstart", manageTooltip)

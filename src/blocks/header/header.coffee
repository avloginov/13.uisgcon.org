$ ->
	$block = $("#header")
	return unless $block.length
	$window = $(window)
	preakpoint = $block.offset().top
	$menuToggle = $block.find(".header__toggle")
	$tabletMenu = $block.find(".header__menu")
	$mobileMenu = $block.find(".header__content")

	stickyHeader = (event) ->
		scrollTop = $(window).scrollTop()

		if scrollTop >= preakpoint and not $block.hasClass("header_fixed")
			$block.addClass("header_fixed")
		else if scrollTop <= preakpoint and $block.hasClass("header_fixed")
			$block.removeClass("header_fixed")
			$menuToggle.removeClass("active")
			$tabletMenu.removeAttr("style")

	menuToggle = (event) ->
		$this = $(@)
		$this.closest(".header").toggleClass("menu-open")

	$window.on("scroll", throttle(stickyHeader, 50))
	$menuToggle.on("click", menuToggle)

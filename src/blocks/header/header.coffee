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
		$this.toggleClass("active")

		if window.innerWidth > 768
			$tabletMenu.slideToggle("100")
			$tabletMenu.toggleClass("active")
		else
			$mobileMenu.slideToggle("100")
			$mobileMenu.toggleClass("active")

	closeMobileMenu = (event) ->
		if $menuToggle.hasClass("active")

			if window.innerWidth > 768 and $mobileMenu.hasClass("active")
				$menuToggle.removeClass("active")
				$mobileMenu.removeAttr("style").removeClass("active")

			else if window.innerWidth > 1000 and $tabletMenu.hasClass("active")
				$menuToggle.removeClass("active")
				$tabletMenu.removeAttr("style").hasClass("active")

			else if window.innerWidth < 768 and $tabletMenu.hasClass("active")
				$menuToggle.removeClass("active")
				$tabletMenu.removeAttr("style").hasClass("active")

	$window.on("scroll", throttle(stickyHeader, 50))
	$window.on("resize", throttle(closeMobileMenu, 50))
	$menuToggle.on("click", menuToggle)

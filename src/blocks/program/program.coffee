$ ->
	$block = $(".program")
	$header = $(".header")
	$tabs = $block.find(".program__nav-item")
	$tabsContent = $block.find(".program__tab-pane")
	$tabsContentToggle = $block.find(".program__column-title")
	slideSpeed = 150
	activeElement = $tabsContentToggle.parent().filter(".active").index()

	$tabs.on "click", (event) ->
		event.preventDefault()

		$this = $(event.currentTarget)

		$tabs.removeClass("active")
		$this.addClass("active")

		$currentTabsContent = $tabsContent.removeClass("active").filter($this.find(".program__nav-link").attr("href")).addClass("active")

		if activeElement isnt -1 and window.innerWidth <= 1240
			$currentTabsContent.find($tabsContentToggle.parent()).eq(activeElement).addClass("active").find(".program__list").slideDown(slideSpeed)

	$tabsContentToggle.on "click", (event) ->
		if window.innerWidth <= 1240
			$this = $(event.currentTarget).parent()

			if $this.hasClass("active")
				activeElement = -1
				$this.removeClass("active").find(".program__list").slideUp(slideSpeed)
			else
				activeElement = $this.index()
				$this.addClass("active").find(".program__list").slideDown(slideSpeed)

			$tabsContentToggle.parent().not($this).removeClass("active").find(".program__list").slideUp(slideSpeed)

			$("html, body").animate({ scrollTop: $tabs.parent().offset().top - $header.height() }, 300)

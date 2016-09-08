$ ->
	$block = $(".program")
	$header = $(".header")
	$tabs = $block.find(".program__nav-link")
	$tabsContent = $block.find(".program__tab-pane")
	$tabsContentToggle = $block.find(".program__column")

	$tabs.on "click", (event) ->
		event.preventDefault()

		$this = $(@)
		$parent = $this.parent()

		$tabs.parent().removeClass("active")
		$parent.addClass("active")

		$tabsContent.removeClass("active")
		$tabsContentToggle.filter(".active").removeClass("active").find(".program__list").slideUp("100")
		$tabsContent.filter($this.attr("href")).addClass("active")

	$tabsContentToggle.on "click", (event) ->
		$this = $(event.currentTarget)

		$tabsContentToggle.not($this).filter(".active").removeClass("active").find(".program__list").slideUp("100")
		$this.addClass("active").find(".program__list").slideToggle("100")

		if window.innerWidth < 768
			$("html, body").animate({ scrollTop: $this.offset().top - $header.height() }, 300)

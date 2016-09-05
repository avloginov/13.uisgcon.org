$ ->
	$block = $(".program")
	$tabs = $block.find(".program__nav-link")
	$tabsContent =  $block.find(".program__tab-pane")

	$tabs.on "click", (event) ->
		event.preventDefault()

		$this = $(@)
		$parent = $this.parent()

		$tabs.parent().removeClass("active")
		$parent.addClass("active")

		$tabsContent.removeClass("active")
		$tabsContent.filter($this.attr("href")).addClass("active")

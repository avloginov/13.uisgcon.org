$.modal = (opts) ->
	$modal = $ """<div class="modal" tabindex="-1"></div>"""
	if opts.mods
		$modal.mod key, value for key, value of opts.mods
	$modal.append $bg = $ """<div class="modal__bg"></div>"""
	$modal.append $header = $ """<div class="modal__header wrap"></div>"""
	$header.append $close = $ """<div class="modal__close"><span>Вернуться</span></div>"""
	$header.append $("""<div class="modal__title"></div>""").text opts.title if opts.title
	$header.append $("""<div class="modal__icon modal__icon_#{opts.icon}"></div>""") if opts.icon
	$modal.append $("""<div class="modal__content wrap"></div>""").append opts.content if opts.content

	open = ->
		$("body").append $modal
		setTimeout ->
			$modal.mod "state", "opening"
			setTimeout ->
				$modal.mod "state", "opened"
			, 500
		, 1

	close = ->
		return unless $modal
		$modal.mod "state", "closing"
		$(document).trigger "modal.closing", [ $modal ]
		setTimeout ->
			return unless $modal
			$modal.remove()
			$(document).trigger "modal.closed", [ $modal ]
			$modal = null
		, 500

	$modal.on "modal.close", close

	$close.click close

	open()

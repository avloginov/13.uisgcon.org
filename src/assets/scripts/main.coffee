# unless touch device
unless 'ontouchstart' in window or window.DocumentTouch and document instanceof DocumentTouch
	# replace tel: links to callto:
	$("a[href^='tel:']").each ->
		$(@).attr 'href', $(@).attr('href').replace('tel:', 'callto:')

$ ->
	FastClick.attach(document.body)

window.throttle = (func, ms) ->
	isThrottled = false
	savedArgs = undefined
	savedThis = undefined

	wrapper = ->
		if isThrottled
			savedArgs = arguments
			savedThis = this
			return
		func.apply this, arguments
		isThrottled = true
		setTimeout (->
			isThrottled = false
			if savedArgs
				wrapper.apply savedThis, savedArgs
				savedArgs = savedThis = null
			return
		), ms
		return

	wrapper

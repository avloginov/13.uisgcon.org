$ ->
	$block = $("#map-interactive")
	return unless $block.length

	{ title, latitude, longitude, zoom, icon } = $block.data()

	latitude = 50.435883 unless latitude
	longitude = 30.524122 unless longitude
	zoom = 15 unless zoom

	throttle = (func, ms) ->
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

	window.initMap = ->
		coordinates =
			lat: latitude
			lng: longitude

		map = new google.maps.Map $block.get(0),
			center: coordinates
			zoom: zoom
			scrollwheel: false

		imageData =
			url: icon
			scaledSize: new google.maps.Size(56, 66)

		marker = new google.maps.Marker
			position: coordinates
			map: map
			icon: imageData
			title: title

		google.maps.event.addDomListener(window, "resize", initMap)
		# google.maps.event.addDomListener(window, "resize", throttle(initMap, 100))

	loadMapAPI = ->
		script = document.createElement("script")
		script.type = "text/javascript"
		script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC_Pw1u9go0v9FoQECn1oDMRX7vMKO0Rwk&callback=initMap"
		document.body.appendChild(script)

	$(window).on("load", loadMapAPI)

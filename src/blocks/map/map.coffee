$ ->
	$block = $("#map-interactive")
	return unless $block.length

	{ title, latitude, longitude, zoom, icon } = $block.data()

	latitude = 50.436223 unless latitude
	longitude = 30.525358 unless longitude
	zoom = 15 unless zoom

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

	loadMapAPI = ->
		script = document.createElement("script")
		script.type = "text/javascript"
		script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC_Pw1u9go0v9FoQECn1oDMRX7vMKO0Rwk&callback=initMap"
		document.body.appendChild(script)

	$(window).on("load", loadMapAPI)

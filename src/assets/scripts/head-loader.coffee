###---
uglify: true
###

scripts = []
styles = []

window.addEventListener "load", ->
	setTimeout (->
		loadStyle style for style in styles
	), 1
	loadScript script for script in scripts

loadStyle = (url) ->
	element = document.createElement("link")
	element.rel = "stylesheet"
	element.href = url
	head = document.getElementsByTagName("head")[0]
	head.appendChild element

loadScript = (url) ->
	element = document.createElement("script")
	element.type = "text/javascript"
	element.src = url
	element.async = "true"
	head = document.getElementsByTagName("head")[0]
	head.appendChild element

window.enqueueStyle = (url) -> styles.push url
window.enqueueScript = (url) -> scripts.push url

filters = [
	///^vendor/.*///
	///^data/.*///
	///^globals/.*///
	///^layouts/.*///
]
module.exports =	
	'noprocess+': filters
	'nowrite+': filters.concat [
		///^assets/scripts/.*///
		///^assets/styles/.*///
	]
	'ignore+': [
		///^globals/.*///
	]
	'out': 'server/public'
	"rawExtnames+": [
		'.mp4'
		'.pdf'
		'.doc'
		'.docx'
	]

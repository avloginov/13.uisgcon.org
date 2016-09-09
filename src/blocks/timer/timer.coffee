$.fn.makeCustomTimer = ->
	@each ->
		{value} = $(@).data()
		$(@).find(".timer__item").on 'setTimerDigit', (e, v) ->
			digitMax = switch $(@).attr 'data-timer-rel'
				when 'seconds', 'minutes' then 59
				when 'hours' then 23
				when 'days' then 6
				else 100
			percents = 100 - 100 * v / digitMax
			$(@).find(".timer__spinner").css transform: "rotate(#{360 / 100 * percents}deg)"
			$(@).find(".timer__mask").css opacity: if percents > 50 then 0 else 1
			$(@).find(".timer__filler").css opacity: if percents > 50 then 1 else 0
			$(@).find(".timer__border-left").css 'z-index': if percents > 50 then 0 else 4
			$(@).find(".timer__border-right").css opacity: if percents > 50 then 0 else 1
			v = "0#{v}" if v < 10
			$(@).find(".timer__digit").text v
		display = (seconds) =>
			digits =
				seconds: seconds % 60
				minutes: Math.floor(seconds / 60) % 60
				hours: Math.floor(seconds / (60 * 60)) % 24
				days: Math.floor(seconds / (60 * 60 * 24))
			for k, v of digits
				$(@).find(".timer__item[data-timer-rel='#{k}']").trigger 'setTimerDigit', v
		display value
		if value > 0
			interval = setInterval =>
				value -= 1
				display value
				$(@).trigger "timer.tick", value
				if value <= 0
					clearInterval interval
					$(@).trigger "timer.finished"
			, 1000
		else
			$(@).trigger "timer.finished"
	@

$ ->
	$block = $('.timer')
	return unless $block.length
	$timerLabel = $block.find(".timer__label")

	$(".timer").makeCustomTimer()


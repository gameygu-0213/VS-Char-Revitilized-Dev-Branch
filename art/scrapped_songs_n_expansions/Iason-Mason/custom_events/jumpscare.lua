function onCreate()
	makeLuaSprite('slendy', 'SlendyWega', 0, 0)
	setScrollFactor('slendy', 0, 0)
	scaleObject('slendy', 0.6, 0.6)
	setObjectCamera('slendy', 'hud')
	screenCenter('slendy', 'xy')
	setProperty('slendy.alpha', 0)
	addLuaSprite('slendy', false)
end

local dur = 0.7
function onEvent(name, value1, value2)
	if name == "jumpscare" then
		if value1 ~= '' then dur = tonumber(value1) else dur = 0.7 end

		cancelTween('sA')
		doTweenX('sX', 'slendy.scale', 1, 0.1, 'linear')
		doTweenY('sY', 'slendy.scale', 1, 0.1, 'linear')
		setProperty('slendy.alpha', 1)
	end
end

function onTweenCompleted(tag)
	if tag == 'sX' then
		doTweenX('sX2', 'slendy.scale', 0.6, dur, 'linear')
		doTweenY('sY2', 'slendy.scale', 0.6, dur, 'linear')
		doTweenAlpha('sA', 'slendy', 0, dur, 'linear')
	end
end
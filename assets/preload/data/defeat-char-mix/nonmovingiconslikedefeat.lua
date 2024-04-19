-- stay PUT YOU DAMN ICONS

function onCreate()
setProperty('healthBar.alpha', tonumber(0))
setProperty('healthBarOverlay.alpha', tonumber(0))
end

function onUpdatePost()
setProperty('iconP1.x', 600)
setProperty('iconP2.x', 500)
setProperty('iconP2.animation.curAnim.curFrame', 0)
end
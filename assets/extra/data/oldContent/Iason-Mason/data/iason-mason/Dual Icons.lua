function onCreate()
    precacheImage('plexi-mason') -- change "iconnamefile" to your correct file
    precacheImage('plexi-mason-dead') -- change "iconnamefile" to your correct file
    precacheImage('plexi-mason-win') -- change "iconnamefile" to your correct file
end

function onUpdate(elapsed)
    if getProperty('health') < 0.4 then
        setProperty('plexi-mason.visible', false) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-dead.visible', true) -- change "plexi-mason-dead" to your correct name
    else
        setProperty('plexi-mason.visible', true) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-dead.visible', false) -- change "plexi-mason-dead" to your correct name
    end
	if getProperty('health') > 1.6 then 
	setProperty('plexi-mason.visible', false) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.visible', true) -- change "plexi-mason" to your correct name
    else
	setProperty('plexi-mason.visible', true) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.visible', false) -- change "plexi-mason" to your correct name
    end
end


function onCreatePost()
        makeLuaSprite('plexi-mason', 'plexi-mason', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile" to your correct file
        setObjectCamera('plexi-mason', 'hud') -- change "plexi-mason" to your correct name
        addLuaSprite('plexi-mason', true) -- change "plexi-mason" to your correct name
        setObjectOrder('plexi-mason', getObjectOrder('iconP1') + 1) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason.flipX', true) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason.visible', true) -- change "plexi-mason" to your correct name

        makeLuaSprite('plexi-mason-win', 'plexi-mason-win', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile" to your correct file
        setObjectCamera('plexi-mason-win', 'hud') -- change "plexi-mason" to your correct name
        addLuaSprite('plexi-mason-win', true) -- change "plexi-mason" to your correct name
        setObjectOrder('plexi-mason-win', getObjectOrder('iconP1') + 1) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.flipX', true) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.visible', true) -- change "plexi-mason" to your correct name

        makeLuaSprite('plexi-mason-dead', 'plexi-mason-dead', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile2" to your correct file
        setObjectCamera('plexi-mason-dead', 'hud') -- change "plexi-mason-dead" to your correct name
        addLuaSprite('plexi-mason-dead', true) -- change "plexi-mason-dead" to your correct name
        setObjectOrder('plexi-mason-dead', getObjectOrder('iconP1') + 1) -- change "plexi-mason-dead" to your correct name
        setProperty('plexi-mason-dead.flipX', true) -- change "plexi-mason-dead" to your correct name
        setProperty('plexi-mason-dead.visible', false) -- change "plexi-mason-dead" to your correct name
end

function onUpdatePost(elapsed)
        setProperty('plexi-mason.x', getProperty('iconP1.x') + 50) -- icon location X (firstIcon) and change "plexi-mason" to your correct name
        setProperty('plexi-mason.angle', getProperty('iconP1.angle')) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason.y', getProperty('iconP1.y') - 50) -- icon location Y (firstIcon) and change "plexi-mason" to your correct name
        setProperty('plexi-mason.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (firstIcon) and change "plexi-mason" to your correct name
        setProperty('plexi-mason.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (FirstIcon) and change "plexi-mason" to your correct name

        setProperty('plexi-mason-win.x', getProperty('iconP1.x') + 50) -- icon location X (firstIcon) and change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.angle', getProperty('iconP1.angle')) -- change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.y', getProperty('iconP1.y') - 50) -- icon location Y (firstIcon) and change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (firstIcon) and change "plexi-mason" to your correct name
        setProperty('plexi-mason-win.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (FirstIcon) and change "plexi-mason" to your correct name

        setProperty('plexi-mason-dead.x', getProperty('iconP1.x') + 50) -- icon location X (losedIcon) and change "plexi-mason-dead" to your correct name
        setProperty('plexi-mason-dead.angle', getProperty('iconP1.angle')) -- change "plexi-mason-dead" to your correct name
        setProperty('plexi-mason-dead.y', getProperty('iconP1.y') - 50) -- icon location Y (loseIcon) and change "plexi-mason-dead" to your correct name
        setProperty('plexi-mason-dead.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (loseIcon) and change "plexi-mason-dead" to your correct name
        setProperty('plexi-mason-dead.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (loseIcon) and change "plexi-mason-dead" to your correct name
end

function onUpdate(elapsed)
    if not middleScroll then
        setPropertyFromGroup('opponentStrums', 0, 'x', -5000);
        setPropertyFromGroup('opponentStrums', 1, 'x', -5000);
        setPropertyFromGroup('opponentStrums', 2, 'x', -5000);
        setPropertyFromGroup('opponentStrums', 3, 'x', -5000);

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320);
    end
end

function onBeatHit()

if curBeat == 1 then

	setProperty('botplayTxt.visible', false)
        setProperty('healthBar.visible', false) -- change this & next 3 to true if u want health
        setProperty('healthBarBG.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('timeTxt.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)

end

if curBeat == 32 then

        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('timeTxt.visible', true)
        setProperty('timeBar.visible', true)
        setProperty('timeBarBG.visible', true)

end
end
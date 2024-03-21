--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit thats been improved since 0.5.A1
	makeLuaSprite('SkyTrees', 'stages/triostagenew/skytrees', -650, -400)
	setScrollFactor('SkyTrees', 0.5, 0.5)
	scaleObject('SkyTrees', 1.75, 1.75);

	makeLuaSprite('TreesFG', 'stages/triostagenew/treesFG', -650, -1300)
	setScrollFactor('TreesFG', 0.8, 0.8)
	scaleObject('TreesFG', 1.75, 1.75);

	makeLuaSprite('Grass', 'stages/triostagenew/grass', -650, 120)
	setScrollFactor('Grass', 1, 1)
	scaleObject('Grass', 1.75, 1.75);

	makeLuaSprite('Sidewalk', 'stages/triostagenew/sidewalk', -650, 380)
	setScrollFactor('Sidewalk', 1, 1)
	scaleObject('Sidewalk', 1.75, 1.75);

	addLuaSprite('SkyTrees', false)
	addLuaSprite('TreesFG', false)
	addLuaSprite('Grass', false)
	addLuaSprite('Sidewalk', false)
	
end
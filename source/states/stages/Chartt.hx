package states.stages;

import states.stages.objects.*;

class Chartt extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	override function create()
	{
		// Spawn your stage sprites here.
		// Characters are not ready yet on this function, so you can't add things above them yet.
		// Use createPost() if that's what you want to do.

        var farlights:BGSprite = new BGSprite('bright thingies', -903, -256, 0.8, 0.8);
		add(farlights);
		if(!ClientPrefs.data.lowQuality) { // optimization calls for some things to be left out. mainly because it would lag the hell out of shitty computers :3
        var darkmet:BGSprite = new BGSprite('darkmetal thingy', -723, 137, 0.8, 0.8);
		add(darkmet);
        var mets:BGSprite = new BGSprite('metal thingy', -888, -250, 0.8, 0.8);
		add(mets); //lets go mets
        var hallwall:BGSprite = new BGSprite('hallwalls', -853, 71, 0.8, 0.8);
		hallwall.setGraphicSize(Std.int(hallwall.width * 0.75));
		add(hallwall);
        var hallfloor:BGSprite = new BGSprite('hallfloor', -903, 389, 0.8, 0.8);
		hallfloor.setGraphicSize(Std.int(hallfloor.width * 0.75));
		add(hallfloor);
        var halllight:BGSprite = new BGSprite('hall light', -903, 87, 0.8, 0.8);
		add(halllight);
		}
        var floor:BGSprite = new BGSprite('floor', -903, -256, 1, 1);
		add(floor);

	}
	
	override function createPost()
	{
		// Use this function to layer things above characters!
            
        var light:BGSprite = new BGSprite('main light', -903, -235, 1, 1);
		add(light);

		if(!ClientPrefs.data.lowQuality) { // optimization calls for some things to be left out.
        var ramps:BGSprite = new BGSprite('foreground thingy', -903, 703, 1.1, 1);
		add(ramps);

        var wires:BGSprite = new BGSprite('foreground wires', -903, -256, 1.1, 1);
		add(wires);
		}

	}

	override function update(elapsed:Float)
	{
		// Code here
	}

	override function stepHit()
	{
		// Code here
	}
	override function beatHit()
	{
		// Code here
	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

	// For events
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "My Event":
		}
	}
	override function eventPushed(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events that doesn't need different assets based on its values
		switch(event.event)
		{
			case "My Event":
				//precacheImage('myImage') //preloads images/myImage.png
				//precacheSound('mySound') //preloads sounds/mySound.ogg
				//precacheMusic('myMusic') //preloads music/myMusic.ogg
		}
	}
	override function eventPushedUnique(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events where its values affect what assets should be preloaded
		switch(event.event)
		{
			case "My Event":
				switch(event.value1)
				{
					// If value 1 is "blah blah", it will preload these assets:
					case 'blah blah':
						//precacheImage('myImageOne') //preloads images/myImageOne.png
						//precacheSound('mySoundOne') //preloads sounds/mySoundOne.ogg
						//precacheMusic('myMusicOne') //preloads music/myMusicOne.ogg

					// If value 1 is "coolswag", it will preload these assets:
					case 'coolswag':
						//precacheImage('myImageTwo') //preloads images/myImageTwo.png
						//precacheSound('mySoundTwo') //preloads sounds/mySoundTwo.ogg
						//precacheMusic('myMusicTwo') //preloads music/myMusicTwo.ogg
					
					// If value 1 is not "blah blah" or "coolswag", it will preload these assets:
					default:
						//precacheImage('myImageThree') //preloads images/myImageThree.png
						//precacheSound('mySoundThree') //preloads sounds/mySoundThree.ogg
						//precacheMusic('myMusicThree') //preloads music/myMusicThree.ogg
				}
		}
	}
}
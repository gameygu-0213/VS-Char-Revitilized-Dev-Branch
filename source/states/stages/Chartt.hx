// why am i 3 stages one stage file? because.
package states.stages;

import states.stages.objects.*;
//import backend.BaseStage;
import states.PlayState; // for getting curStage lmao

class Chartt extends BaseStage
{

	private var curStage = PlayState.curStage;
	private var curPath:String = 'stages/'; // as a backup so it doesnt null out
	var skyTrees:BGSprite;
	var treesFG:BGSprite;
	var grass:BGSprite;
	var sidewalk:BGSprite;
	var fLASH:FlxSprite;
// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	override function create()
		{
			switch (curStage.toLowerCase())
			{
				case 'postforestburn':
					curPath = 'stages/FOREST/POST_BURNING/';
				case 'preforestburn':
					curPath = 'stages/FOREST/PRE_BURNING/';
				case 'burningforest':
					curPath = 'stages/FOREST/BURNING/';
			}

			skyTrees = new BGSprite(curPath + 'skytrees', -650, -400, 0.5, 0.5);
			skyTrees.setGraphicSize(Std.int(skyTrees.width * 1.75));
			skyTrees.updateHitbox();
					
			treesFG = new BGSprite(curPath + 'treesFG', -650, -1300, 0.8, 0.8);
			treesFG.setGraphicSize(Std.int(treesFG.width * 1.75));
			treesFG.updateHitbox();
					
			grass = new BGSprite(curPath + 'grass', -650, 120);
			grass.setGraphicSize(Std.int(grass.width * 1.75));
			grass.updateHitbox();

			sidewalk = new BGSprite(curPath + 'sidewalk', -650, 380);
			sidewalk.setGraphicSize(Std.int(sidewalk.width * 1.75));
			sidewalk.updateHitbox();

			add(skyTrees);
			add(treesFG);
			add(grass);
			add(sidewalk);
		}

		var timesFactor:Float;
		
		override function createPost()
		{
			// Use this function to layer things above characters!
				fLASH = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
				if (defaultCamZoom < 1)
					{
						timesFactor = defaultCamZoom + 1;
						trace('Times Factor: ' + timesFactor);
				fLASH.setGraphicSize(Std.int(fLASH.width * timesFactor));
					}
				fLASH.alpha = 0;
				fLASH.scrollFactor.set(1, 1);
				fLASH.screenCenter();
				fLASH.updateHitbox();
				fLASH.camera = camHUD;
				add(fLASH);
		}
	
		override function update(elapsed:Float)
		{
			// Code here
		}
	
		
		override function countdownTick(count:Countdown, num:Int)
		{
			switch(count)
			{
				case THREE: //num 0
				case TWO: //num 1
				case ONE: //num 2
				case GO: //num 3
				case START:
					boyfriend.playAnim('hey');
					boyfriend.specialAnim = true;
			}
		}
	
		// Steps, Beats and Sections:
		//    curStep, curDecStep
		//    curBeat, curDecBeat
		//    curSection
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
				case "BURN BABY":
					if (value1 != null && value1 != '')
						{
					skyTrees.destroy();
					treesFG.destroy();
					grass.destroy();
					sidewalk.destroy();
					switch (value1.toLowerCase())
			{
				case 'burnt':
					curPath = 'stages/FOREST/POST_BURNING/';
				case 'unburnt':
					curPath = 'stages/FOREST/PRE_BURNING/';
				case 'burn':
					curPath = 'stages/FOREST/BURNING/';
			}

			skyTrees = new BGSprite(curPath + 'skytrees', -650, -400, 0.5, 0.5);
			skyTrees.setGraphicSize(Std.int(skyTrees.width * 1.75));
			skyTrees.updateHitbox();
					
			treesFG = new BGSprite(curPath + 'treesFG', -650, -1300, 0.8, 0.8);
			treesFG.setGraphicSize(Std.int(treesFG.width * 1.75));
			treesFG.updateHitbox();
					
			grass = new BGSprite(curPath + 'grass', -650, 120);
			grass.setGraphicSize(Std.int(grass.width * 1.75));
			grass.updateHitbox();

			sidewalk = new BGSprite(curPath + 'sidewalk', -650, 380);
			sidewalk.setGraphicSize(Std.int(sidewalk.width * 1.75));
			sidewalk.updateHitbox();

			addBehindDad(skyTrees);
			addBehindDad(treesFG);
			addBehindDad(grass);
			addBehindDad(sidewalk);
			}

			if (value2 != '' && value2 != null)
				{
					if (Std.parseInt(value2) != null) {
			FlxTween.tween(fLASH, {alpha: 1}, 0.00001, {onComplete: function(tween:FlxTween) {
				FlxTween.tween(fLASH, {alpha: 0}, Std.parseInt(value2));
				
			}});
		} else {
			trace('value2 NOT AN INTEGER!');
		}
			
				} else {
					trace('value2 IS NULL!!');
				}
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
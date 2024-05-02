package states.stages;

import states.stages.objects.*;

class Chartt extends BaseStage
{

	override function create()
	{
		var bg:BGSprite = new BGSprite('skytrees', -600, 600, 0.9, 0.9);
		add(bg);

		var stageFront:BGSprite = new BGSprite('treesFG', -600, 600, 0.9, 0.9);
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		add(stageFront);
		if(!ClientPrefs.data.lowQuality) {
			var stageLight:BGSprite = new BGSprite('grass', -600, 600, 0.9, 0.9);
			stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
			stageLight.updateHitbox();
			add(stageLight);
			var stageLight:BGSprite = new BGSprite('sidewalk', -600, 600, 0.9, 0.9);
			stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
			stageLight.updateHitbox();
			add(stageLight);
		}
	}

	override function eventPushed(event:objects.Note.EventNote)
	{
		switch(event.event)
		{

		}
	}

	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{

		}
	}
}
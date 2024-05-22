package states.stages;

class White extends BaseStage
{
	override function create()
	{
        //lmao the easiest to make stage, just 2 lines of code
		var whiteLmao:FlxSprite = new FlxSprite(-2500, -1000).makeGraphic(6000, 4000, FlxColor.WHITE);
		add(whiteLmao);
        
	}
}
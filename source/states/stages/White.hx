package states.stages;

class White extends BaseStage
{

	
	override function create()
	{
        //lmao the easiest to make stage, just 2 lines of code as of 5/28/24 but now its more complicated lmao.
		var whiteLmao:FlxSprite = new FlxSprite(-2500, -1000).makeGraphic(6000, 4000, FlxColor.WHITE);
		add(whiteLmao);
        
	}
	
	var fallenChair:BGSprite;
	override function createPost() {
		fallenChair = new BGSprite('fallenCharLmao');
		fallenChair.x = boyfriend.x;
		fallenChair.y = dad.y;
		addBehindBF(fallenChair);
		trace('the X and Y of the Fallen Chair lmao = (' + fallenChair.x + ', ' + fallenChair.y + ')');
	}

	override function beatHit() {
		if (curBeat <= 193) {
			fallenChair.alpha = 0;
		}
		if (curBeat == 193) {
			fallenChair.alpha = 1;
		}
	}
}
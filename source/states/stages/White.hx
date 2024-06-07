package states.stages;

class White extends BaseStage
{

	var fallenChair:BGSprite;
	override function create()
	{
        //lmao the easiest to make stage, just 2 lines of code as of 5/28/24 but now its more complicated lmao.
		var whiteLmao:FlxSprite = new FlxSprite(-2500, -1000).makeGraphic(6000, 4000, FlxColor.WHITE);
		add(whiteLmao);

		fallenChair = new BGSprite('fallenCharLmao');
		//fallenChair.alpha = 0;
        
	}

	override function createPost() {
		fallenChair.x = boyfriend.x;
		fallenChair.y = dad.y;
		addBehindBF(fallenChair);
		trace('the X and Y of the Fallen Chair lmao = (' + fallenChair.x + ', ' + fallenChair.y + ')');
	}

	var playingAnim:Bool = false;
	var animTimer:FlxTimer = new FlxTimer();
	override function beatHit() {
		if (curBeat <= 193) {
			fallenChair.alpha = 0;
		}
		if (curBeat == 193) { // REMEMBER TO CHANGE TO THE RIGHT FUCKING BEAT LMAO its 1 over because otherwise it wont work properly lmao
			trace('CURBEAT 193 HIT, PLAYING GET UP ANIM');
			fallenChair.alpha = 1;
		}
	}
}
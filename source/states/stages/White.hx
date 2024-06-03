package states.stages;

class White extends BaseStage
{

	var fallenChair:BGSprite;
	var mCBFGetUp:BGSprite;
	override function create()
	{
        //lmao the easiest to make stage, just 2 lines of code as of 5/28/24 but now its more complicated lmao.
		var whiteLmao:FlxSprite = new FlxSprite(-2500, -1000).makeGraphic(6000, 4000, FlxColor.WHITE);
		add(whiteLmao);

		fallenChair = new BGSprite('fallenCharLmao');
		//fallenChair.alpha = 0;

		mCBFGetUp = new BGSprite('MCBF_Get_Up');
		mCBFGetUp.frames = Paths.getSparrowAtlas('MCBF_Get_Up');
		mCBFGetUp.animation.addByPrefix('get_up', 'MCBF Get Up', 24, false); // AFTER FINALLY FIGURING OUT THE FRAMES ISSUE, I CAN ADD THE DAMN GET UP ANIM LMAO.
		//mCBFGetUp.alpha = 0;
        
	}

	override function createPost() {
		fallenChair.x = boyfriend.x;
		fallenChair.y = dad.y;
		addBehindBF(fallenChair);
		trace('the X and Y of the Fallen Chair lmao = (' + fallenChair.x + ', ' + fallenChair.y + ')');

		mCBFGetUp.x = boyfriend.x;
		mCBFGetUp.y = dad.y;
		add(mCBFGetUp);
		trace('THE MCBF GET UP FRAMES ARE: ' + mCBFGetUp.frames + '\n and the X and Y = (' + mCBFGetUp.x + ', ' + mCBFGetUp.y + ')');
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
			playingAnim = true;
			mCBFGetUp.animation.play('get_up', true);
			if (!animTimer.active)
				{
			animTimer.start(0.4166666666666667, endTimer); // used a calculator for exact measurements 🤓 // note 2 i hate myself for using the nerd emoji in a comment.
		}
		}
	}

	function endTimer(tmr:FlxTimer) { 
		trace('ENDED THE VERY PRECISE ANIM TIMER LMAO');
		playingAnim = false;
	}

	override function update(elapsed:Float) {
		if (!playingAnim) 
			{
				mCBFGetUp.alpha = 0;
				boyfriend.alpha = 1;
			} else {
				mCBFGetUp.alpha = 1;
				boyfriend.alpha = 0;
			}
	}
}
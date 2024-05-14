package states;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		trace("Showed the Outdated Message woo!");
		// FlxG.sound.music.volume = 0; 
		FlxG.sound.music.stop(); // better solution???
		FlxG.sound.play(Paths.sound('UpdateMenuEnter'));
		super.create();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBG/Error'));
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Woah, Watch out you're running the wrong version   \n
			'YOURE THE WRONG VERSION' \n
			(" + MainMenuState.VSCharVersion + ") *Vine Boom*,\n
			Its now at version " + TitleState.updateVersion + "!\n
			Press ESCAPE to proceed anyway.\n
			\n
			Seriosuly, Update.",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/gameygu-0213/Char-Engine-New/releases");
				trace("Opening The Github!");
			}
			else if(controls.BACK) {
				leftState = true;
				trace("Skipped.");
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
				FlxG.sound.music.volume = 1;
				trace("Back to the menus!");
					}
				});
			}
		}
		super.update(elapsed);
	}
}

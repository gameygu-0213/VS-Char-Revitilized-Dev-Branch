package states;

class DevBuildWarningState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		if (ClientPrefs.data.ShowWarnings) {
		trace("Showed the Devbuild Warning woo!");
		FlxG.sound.music.volume = 0;
		FlxG.sound.play(Paths.sound('menuError'));
		super.create();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuError'));
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"WARNING THIS IS A DEVBUILD
			\n IF YOU RECIEVED THIS FROM ANYONE OTHER THAN,
			\n Anny (aka Char or Char Golden),
			\n \n YOU COULD HAVE RECIEVED A MALICOUS/ILLEGITIMATE BUILD!
			\n PLEASE REPORT THIS TO '@annyconducter' IN THE DISCORD
			\n (Enter to go to the discord, ESC to skip)",32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
		}
		else if (ClientPrefs.data.ShowWarnings == false) {	
		trace("Showed the Devbuild Warning but immediately skipping lol");
		FlxG.sound.music.volume = 0;
		FlxG.sound.play(Paths.sound('menuError'));
		super.create();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuError'));
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"This warning disabled by Show Warnings being disabled lol",32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
		leftState = true;
		trace('Skipped by client prefs!'); }
			
		
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://discord.gg/BuGUaYMtxR");
				trace("Opening Discord!");

			}
			else if(controls.BACK) {
				leftState = true;
				trace("Skipped.");
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
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

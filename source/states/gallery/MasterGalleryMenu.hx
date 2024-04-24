// Stole some code from freeplay and modified the master editor menu lol.
package states.gallery;

import states.MainMenuState;
import states.FreeplayState;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUITabMenu;

// cant find files if you dont have the damn LIBRARIES
import sys.FileSystem;
import sys.io.File;

class MasterGalleryMenu extends MusicBeatState
{
	var options:Array<String> = [
		'Story',
		'Main',
		'Bonus'
	];
	//private var grpTexts:FlxTypedGroup<Alphabet>;
	public var NameAlpha:Alphabet;
	private var curSelected = 0;
	var disableScrollSound:Bool = ClientPrefs.data.disableScrollSound;
	var UI_box:FlxUITabMenu;
	var path:String = './assets/images/';

	override function create()
	{
		FlxG.mouse.visible = true;
	
		FlxG.camera.bgColor = FlxColor.BLACK;
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Browsing the Gallery", null);
		#end
		var bg:FlxSprite;

		if (!FileSystem.exists(path +'menuGallery.png') == true)
			{
				bg = new FlxSprite().loadGraphic(MainMenuState.randomizeBG());
				bg.color = 0xFF353535;
			}
		else {
				bg = new FlxSprite().loadGraphic(Paths.image('menuGallery'));
			 }
			 trace(path + 'menuGallery found = ' + Std.string(FileSystem.exists(path +'menuGallery.png')));
		bg.scrollFactor.set();
		add(bg);
        NameAlpha = new Alphabet(40,(FlxG.height / 2),options[curSelected],true);
        NameAlpha.screenCenter(X);
        add(NameAlpha);
		// JUST LET ME HAVE THIS HAXEFLIXEL GODDAMN.
		var tabs = [
			{name: "Mute", label: ''}
		];
	
	UI_box = new FlxUITabMenu(null, tabs, true);
	UI_box.resize(1, 1);
		UI_box.x = (FlxG.width + 1);
		UI_box.y = 0;
        changeSelection();
		addMuteButton();
		add(UI_box);
		super.create();
	}
	function addMuteButton():Void
		{
		var tab_group_mute = new FlxUI(null, UI_box);
		tab_group_mute.name = 'Mute';
		var check_mute = new FlxUICheckBox(-120, -15, null, null, "Mute Scroll Sound", 100);
		check_mute.checked = disableScrollSound;
		check_mute.callback = function()
		{
			ClientPrefs.data.disableScrollSound = check_mute.checked;
			ClientPrefs.saveSettings();
		};
		tab_group_mute.add(check_mute);
		UI_box.addGroup(tab_group_mute);
		}

	override function update(elapsed:Float)
	{
		if (controls.UI_LEFT_P)
            {
            changeSelection(-1);
            }
        if (controls.UI_RIGHT_P)
            {
            changeSelection(1);
            }
        if (controls.UI_UP_P)
            {
            changeSelection(-1);
            }
            if (controls.UI_DOWN_P)
            {
			trace('yo mamma');
            changeSelection(1);
            }
		if (controls.BACK)
			{
			FlxG.mouse.visible = false;
			MusicBeatState.switchState(new MainMenuState());
			}
		if (controls.ACCEPT)
			{
			FlxG.mouse.visible = false;
			switch(options[curSelected]) {
				case 'Story':
					LoadingState.loadAndSwitchState(new StoryGalleryState(), false);
				case 'Main':
					LoadingState.loadAndSwitchState(new MainGalleryState(), false);
				case 'Bonus':
					LoadingState.loadAndSwitchState(new BonusGalleryState(), false);	
			}
			}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;
        if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

        NameAlpha.destroy();
        NameAlpha = new Alphabet(40,(FlxG.height / 2),options[curSelected],true);
        NameAlpha.screenCenter(X);
        add(NameAlpha);
       
        FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}
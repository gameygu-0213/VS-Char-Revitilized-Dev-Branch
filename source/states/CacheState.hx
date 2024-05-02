package states;

import flixel.addons.plugin.taskManager.FlxTask;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import backend.ClientPrefs;

class CacheState extends MusicBeatState
{
    public static var leftState:Bool = false;
    public static var firstView:Bool;

    var messageText:FlxText;
    var messageWindow:FlxSprite; // technically unused till the assets are done
    var messageButtonTextOk:FlxText; 
    var messageButtonTextOff:FlxText;
    var messageButtonBG:FlxSprite; // technically unused till the assets are done
    var charLoadRun:FlxSprite; // technically unused till the assets are done also this isn't "Character Run" i mean Char. the guy the mod is based on.
    var plexiLoadRun:FlxSprite; // technically unused till the assets are done
    var trevorLoadRun:FlxSprite; // technically unused till the assets are done
    var loadBar:FlxSprite;


    var curSelected:Int = 0;

    // Cached Sounds when you enable it
    public static var secretSound:FlxSound;

    override function create()
        {
            var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		    add(bg);

            firstView = ClientPrefs.data.firstCacheStateView;
            leftState = false;

            loadBar = new FlxSprite().makeGraphic(FlxG.width + 200, 20, 0xFF7592B3);
            loadBar.y = FlxG.height - 60;
            add(loadBar);

            charLoadRun = new FlxSprite().makeGraphic(50, 100, 0xFFFFAE00);
            charLoadRun.y = loadBar.y - 100;
            charLoadRun.x = FlxG.width * 0.8;
            add(charLoadRun);

            plexiLoadRun = new FlxSprite().makeGraphic(50, 100, 0xFFE65D7B);
            plexiLoadRun.y = loadBar.y - 100;
            plexiLoadRun.x = charLoadRun.x + 60;
            add(plexiLoadRun);

            trevorLoadRun = new FlxSprite().makeGraphic(50, 100, 0xFF364792);
            trevorLoadRun.y = loadBar.y - 100;
            trevorLoadRun.x = plexiLoadRun.x + 60;
            add(trevorLoadRun);

            messageWindow = new FlxSprite().makeGraphic(700, 580, 0xFFAF7B40);
            messageWindow.x = FlxG.width * 0.225;
            messageWindow.y = FlxG.height * 0.05;
            add(messageWindow);

            if (firstView)
                {
                    messageText = new FlxText(FlxG.width * 0.3, FlxG.height * 0.1, FlxG.width * 0.5, 
                        "Welcome to VS Char Revitalized Alpha 1!
                        \nThis Mod contains FLASHING LIGHTS.
                        \nif you don't wanna see that press 'Enter/Space'
                        \n else, press 'Escape/Backspace'", 32);
                        messageText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                        messageText.screenCenter(X);
		                add(messageText);
                }
                else 
                    {
                        messageText = new FlxText(FlxG.width * 0.3, FlxG.height * 0.1, FlxG.width * 0.5, 
                            "Welcome to VS Char Revitalized Alpha 1!
                            \nthis mod caches sounds to avoid states taking a while to load,
                            \nDo you want to enable caching?
                            \n(This also affects update caching)",32);
                            messageText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                            messageText.screenCenter(X);
                            add(messageText);

                            messageButtonBG = new FlxSprite().makeGraphic(100, 50, 0xFFFF8800);
                            messageButtonBG.x = FlxG.width * 0.31;
                            messageButtonBG.y = FlxG.height - 165;
                            add(messageButtonBG);

                            messageButtonBG = new FlxSprite().makeGraphic(100, 50, 0xFFFF8800);
                            messageButtonBG.x = FlxG.width * 0.625;
                            messageButtonBG.y = FlxG.height - 165;
                            add(messageButtonBG);

                            messageButtonTextOk = new FlxText(FlxG.width * 0.25, FlxG.height - 160, FlxG.width * 0.2,
                                'Yes');
                            messageButtonTextOk.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                            add(messageButtonTextOk);

                            messageButtonTextOff = new FlxText(messageButtonTextOk.x + 400, FlxG.height - 160, FlxG.width * 0.2,
                                'No');
                            messageButtonTextOff.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                            add(messageButtonTextOff);

                            changeSelection();
                            
                    }
                    
        }

        override function update(elapsed:Float) {
            var back:Bool = controls.BACK;
            if (firstView)
                {
                    if (controls.ACCEPT || controls.BACK)
				            if(!back) {
					            ClientPrefs.data.flashing = false;
                                ClientPrefs.data.firstCacheStateView = false;
					            ClientPrefs.saveSettings();
					            FlxG.sound.play(Paths.sound('confirmMenu'));
					            FlxFlicker.flicker(messageText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						        new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							    FlxG.resetState();
						        });
					        });
				            } else {
					            FlxG.sound.play(Paths.sound('cancelMenu'));
                                ClientPrefs.data.firstCacheStateView = false;
                                ClientPrefs.saveSettings();
					            FlxTween.tween(messageText, {alpha: 0}, 1, {
						        onComplete: function (twn:FlxTween) {
							    FlxG.resetState();
						}
					});
				}      
            }
            else
                {
                    if (controls.UI_LEFT)
                        {
                            FlxG.sound.play(Paths.sound('scrollMenu'));
                            changeSelection(-1);
                        }
                    if (controls.UI_RIGHT)
                        {
                            FlxG.sound.play(Paths.sound('scrollMenu'));
                            changeSelection(1);
                        }
                if (controls.ACCEPT)
                    {
                        FlxG.sound.play(Paths.sound('confirmMenu'));
                        if (!ClientPrefs.data.flashing)
                            {
                        switch (curSelected)
                        {
                            //just in case
                            default:
                                ClientPrefs.data.enableCaching = true;
                                ClientPrefs.saveSettings();
                                leftState = true;
                            case 0:
                                ClientPrefs.data.enableCaching = true;
                                ClientPrefs.saveSettings();
                                leftState = true;
                            case 1:
                                ClientPrefs.data.enableCaching = false;
                                ClientPrefs.saveSettings();
                                leftState = true;
                        }
                    }
                    if (ClientPrefs.data.flashing)
                        {
                    switch (curSelected)
                    {
                        //just in case
                        default:
                            FlxFlicker.flicker(messageText, 1, 0.1, false, true, function(flk:FlxFlicker) {
                                ClientPrefs.data.enableCaching = true;
                                ClientPrefs.saveSettings();
                                leftState = true;
                                });
                        case 0:
                            FlxFlicker.flicker(messageText, 1, 0.1, false, true, function(flk:FlxFlicker) {
                                ClientPrefs.data.enableCaching = true;
                                ClientPrefs.saveSettings();
                                leftState = true;
                                });
                        case 1:
                            FlxFlicker.flicker(messageText, 1, 0.1, false, true, function(flk:FlxFlicker) {
                                ClientPrefs.data.enableCaching = false;
                                ClientPrefs.saveSettings();
                                leftState = true;
                                });
                    }
                }
                            
                        
            }
        }
            if (leftState)
                {
				    FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
				    FlxTween.tween(messageText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new TitleState());
                        if (ClientPrefs.data.enableCaching)
                            {
                        secretSound = new FlxSound().loadEmbedded(Paths.sound('SecretSound'), true);
                            }
					    }
				    });
                }
                super.update(elapsed);
        }

        function changeSelection(change:Int = 0) {
            curSelected += change;
            if (curSelected < 0)
                curSelected = 1;
            if (curSelected > 1)
                curSelected = 0;
            Sys.sleep(0.2);
            switch (curSelected)
                {
                    // just in case
                    default:
                        messageButtonTextOff.destroy();
                        messageButtonTextOk.destroy();

                        messageButtonTextOk = new FlxText(FlxG.width * 0.25, FlxG.height - 160, FlxG.width * 0.2,
                            'Yes');
                        messageButtonTextOk.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                        add(messageButtonTextOk);
                        messageButtonTextOff = new FlxText(messageButtonTextOk.x + 400, FlxG.height - 160, FlxG.width * 0.2,
                            'No');
                        messageButtonTextOff.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                        add(messageButtonTextOff);
                    case 0:
                        messageButtonTextOff.destroy();
                        messageButtonTextOk.destroy();

                        messageButtonTextOk = new FlxText(FlxG.width * 0.25, FlxG.height - 160, FlxG.width * 0.2,
                            'Yes');
                        messageButtonTextOk.setFormat("VCR OSD Mono", 32, FlxColor.YELLOW, CENTER);
                        add(messageButtonTextOk);
                        messageButtonTextOff = new FlxText(messageButtonTextOk.x + 400, FlxG.height - 160, FlxG.width * 0.2,
                            'No');
                        messageButtonTextOff.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                        add(messageButtonTextOff);
                    case 1:
                        messageButtonTextOff.destroy();
                        messageButtonTextOk.destroy();

                        messageButtonTextOk = new FlxText(FlxG.width * 0.25, FlxG.height - 160, FlxG.width * 0.2,
                            'Yes');
                        messageButtonTextOk.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                        add(messageButtonTextOk);
                        messageButtonTextOff = new FlxText(messageButtonTextOk.x + 400, FlxG.height - 160, FlxG.width * 0.2,
                            'No');
                        messageButtonTextOff.setFormat("VCR OSD Mono", 32, FlxColor.YELLOW, CENTER);
                        add(messageButtonTextOff);
                }

        }
}
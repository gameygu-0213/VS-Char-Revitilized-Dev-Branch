package states;

import sys.FileSystem;
import animateatlas.AtlasFrameMaker;
import animateatlas.JSONData.AnimationData;
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
    var messageButtonBG2:FlxSprite; // technically unused till the assets are done
    var charLoadRun:FlxSprite; 
    var plexiLoadRun:FlxSprite;
    var trevorLoadRun:FlxSprite; // unused till the assets are done
    var loadBar:FlxSprite;
    public static var localEnableCache:Bool = true; // for calling via TitleState, if you skip the damn warning it will ALWAYS cache bitch.


    var curSelected:Int = 0;

    // Cached Sounds when you enable it
    public static var secretSound:FlxSound;

    override function create()
        {
            var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		    add(bg);

            firstView = ClientPrefs.data.firstCacheStateView;
            leftState = false;
            localEnableCache = false; // for not caching the sound twice.

            loadBar = new FlxSprite().loadGraphic(Paths.image('loadRun/loadBar'));
            loadBar.y = FlxG.height - 60;
            add(loadBar);
            trace(Std.string(loadBar.width));

            if (!FileSystem.exists('./assets/images/loadRun/loadRun.png') != true)
                {
                    trace("Char's Run Anim Found in loadRun.png");
                    charLoadRun = new FlxSprite().loadGraphic(Paths.image('loadRun/loadRun'));
                    charLoadRun.frames = Paths.getSparrowAtlas('loadRun/loadRun');
                }
            else
                {
                    trace("Char's Run Anim not Found in loadRun.png");
                    charLoadRun = new FlxSprite().loadGraphic(Paths.image('loadRun/charLoadRun'));
                    charLoadRun.frames = Paths.getSparrowAtlas('loadRun/charLoadRun');
                }
            charLoadRun.y = loadBar.y - 300;
            charLoadRun.x = FlxG.width * 0.68;
            charLoadRun.animation.addByPrefix('charLoadRun', 'charLoadRun', 26, true);
            charLoadRun.setGraphicSize(100);
            charLoadRun.antialiasing = true;
            add(charLoadRun);
            charLoadRun.animation.play('charLoadRun');

            if (!FileSystem.exists('./assets/images/loadRun/loadRun.png') != true)
                {
                    trace("Plexi's Run Anim Found in loadRun.png");
                    plexiLoadRun = new FlxSprite().loadGraphic(Paths.image('loadRun/loadRun'));
                    plexiLoadRun.frames = Paths.getSparrowAtlas('loadRun/loadRun');
                }
            else
                {
                    trace("Plexi's Run Anim not Found in loadRun.png");
                    plexiLoadRun = new FlxSprite().loadGraphic(Paths.image('loadRun/plexiLoadRun'));
                    plexiLoadRun.frames = Paths.getSparrowAtlas('loadRun/plexiLoadRun');
                }
            plexiLoadRun.y = loadBar.y - 295;
            plexiLoadRun.x = charLoadRun.x + 95;
            plexiLoadRun.animation.addByPrefix('plexiLoadRun', 'plexiLoadRun', 26, true);
            plexiLoadRun.setGraphicSize(100);
            plexiLoadRun.antialiasing = true;
            add(plexiLoadRun);
            plexiLoadRun.animation.play('plexiLoadRun');

            /* 
            if (!FileSystem.exists('./assets/images/loadRun/loadRun.png') != true)
                {
                    trace("Trevor's Run Anim Found in loadRun.png");
                    trevorLoadRun = new FlxSprite().loadGraphic(Paths.image('loadRun/loadRun'));
                    trevorLoadRun.frames = Paths.getSparrowAtlas('loadRun/loadRun');
                }
            else
                {
                    trace("Trevor's Run Anim not Found in loadRun.png");
                    trevorLoadRun = new FlxSprite().loadGraphic(Paths.image('loadRun/plexiLoadRun'));
                    trevorLoadRun.frames = Paths.getSparrowAtlas('loadRun/plexiLoadRun');
                }
            */
            //trevorLoadRun.y = loadBar.y - 90;
            //trevorLoadRun.x = plexiLoadRun.x + 100;
            //trevorLoadRun.animation.addByPrefix('trevorLoadRun', 'trevorLoadRun', 26, true);
            //trevorLoadRun.setGraphicSize(100);
            //trevorLoadRun.antialiasing = true;
            //add(trevorLoadRun);
            //trevorLoadRun.animation.play('trevorLoadRun');

            messageWindow = new FlxSprite().makeGraphic(700, 580, 0xFFAF7B40);
            messageWindow.x = FlxG.width * 0.225;
            messageWindow.y = FlxG.height * 0.05;
            add(messageWindow);

            FlxG.mouse.visible = false;
            
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
                            //messageButtonBG.frames = Paths.getSparrowAtlas('loadRun/button');
                            //messageButtonBG.animation.addByPrefix('buttonIdle', 'buttonIdle', 26, true);
                            //messageButtonBG.animation.addByPrefix('buttonHover', 'buttonHover', 26, true);
                            //messageButtonBG.animation.addByPrefix('buttonPress', 'buttonPress', 26, false);
                            add(messageButtonBG);
                            //messageButtonBG2.animation.play('idle');

                            messageButtonBG2 = new FlxSprite().makeGraphic(100, 50, 0xFFFF8800);
                            messageButtonBG2.x = FlxG.width * 0.625;
                            messageButtonBG2.y = FlxG.height - 165;
                            //messageButtonBG2.frames = Paths.getSparrowAtlas('loadRun/button');
                            //messageButtonBG2.animation.addByPrefix('buttonIdle', 'buttonIdle', 26, true);
                            //messageButtonBG2.animation.addByPrefix('buttonHover', 'buttonHover', 26, true);
                            //messageButtonBG2.animation.addByPrefix('buttonPress', 'buttonPress', 26, false);
                            add(messageButtonBG2);
                            //messageButtonBG2.animation.play('idle');

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


        var timer:FlxTimer = new FlxTimer();
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
                            FlxFlicker.flicker(messageButtonBG, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonBG2, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonTextOff, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonTextOk, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageText, 1, 0.1, false, true, function(flk:FlxFlicker) {
                                ClientPrefs.data.enableCaching = true;
                                ClientPrefs.saveSettings();
                                leftState = true;
                                });
                        case 0:
                            //messageButtonBG.animation.play('buttonPress');
                            FlxFlicker.flicker(messageButtonBG, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonBG2, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonTextOff, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonTextOk, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageText, 1, 0.1, false, true, function(flk:FlxFlicker) {
                                ClientPrefs.data.enableCaching = true;
                                ClientPrefs.saveSettings();
                                leftState = true;
                                });
                        case 1:
                            //messageButtonBG2.animation.play('buttonPress');
                            FlxFlicker.flicker(messageButtonBG, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonBG2, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonTextOff, 1, 0.1, false, true);
                            FlxFlicker.flicker(messageButtonTextOk, 1, 0.1, false, true);
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
                    if (!timer.active)
                        {
                    timer.start(2, backToMenu);
                        }
				    FlxTween.tween(messageText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
                        if (ClientPrefs.data.enableCaching)
                            {
                        secretSound = new FlxSound().loadEmbedded(Paths.sound('SecretSound'), true);
                            }
					    }
				    });
                }
                super.update(elapsed);
        }

        function backToMenu(timer:FlxTimer){
            MusicBeatState.switchState(new TitleState());
            }

        function changeSelection(change:Int = 0) {
            curSelected += change;
            if (curSelected < 0)
                curSelected = 1;
            if (curSelected > 1)
                curSelected = 0;
            Sys.sleep(0.1);
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
                        //messageButtonBG.animation.play('buttonHover');
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
                        //messageButtonBG2.animation.play('buttonHover');
                }

        }
}
package states.gallery;

import openfl.system.System;
import flixel.math.FlxRandom;
import states.gallery.MasterGalleryMenu;

// cant find files if you dont have the damn LIBRARIES
import sys.FileSystem;
import sys.io.File;

class BonusGalleryState extends MusicBeatState
{
    var path:String = './assets/images/gallery/bonus/';
    var galleryImage:FlxSprite;
    var descriptionText:FlxText;
    var descTextField:Array<String> = [
        "MCBF:
        \nHey look who it is!",
        "Desa (to be added):
        \nKobold,
        \nis in the BG of (Insert Song Here)"
    ];
    var galleryImages:Array<String> = [
        'MCBF',
        'Desa'
    ];
    private var curSelected = 0;
    var isAnimated:Bool;

    override function create() {
        //FlxG.camera.bgColor = FlxColor.WHITE;
        trace('Bonus Gallery');
        #if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Browsing the Gallery | Browsing Bonus Images", null);
		#end

        var BG = new FlxSprite().loadGraphic(Paths.image('menuBG/GalleryGreen'));
        BG.setGraphicSize(1350);
        BG.updateHitbox();
        BG.screenCenter();
		add(BG);

        if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') != true) 
            {
                trace(path + galleryImages[curSelected] + '.png Found!');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/bonus/' + galleryImages[curSelected]));
                isAnimated = false;
            }
            else if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') == true)
            {
                trace(path + galleryImages[curSelected] + '.png Not found! oops. if it is correct, CHECK THE FILE NAME');
                path = './assets/images/BGCharacters/';
                if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') != true) 
                    {
                        trace('is BG char');
                        galleryImage = new FlxSprite().loadGraphic(Paths.image('BGCharacters/' + galleryImages[curSelected]));
                        galleryImage.animation.addByPrefix('Idle', 'idle');
                        galleryImage.animation.addByPrefix('Sign', 'cheer');
                        isAnimated = true;
                    }
                    else
                        {
                        galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/missing'));
                        isAnimated = false;
                        }
            }
            galleryImage.x = (FlxG.width * 0.05);
            galleryImage.y = (FlxG.height * 0.25);
            galleryImage.updateHitbox();
            galleryImage.antialiasing = ClientPrefs.data.antialiasing; // uhh it looks like shit without this lol.
            add(galleryImage);

        descriptionText = new FlxText(FlxG.width * 0.615, 4, 0, descTextField[curSelected], 20);
        descriptionText.setFormat("VCR OSD Mono", 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(descriptionText);
        changeSelection();
        super.create();

    }
        

    override public function update(elapsed:Float) {

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
            changeSelection(1);
            }
        if (controls.BACK) 
            {
            //FlxG.camera.bgColor = FlxColor.BLACK;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MasterGalleryMenu());
            }
            if (galleryImages[curSelected].toLowerCase() == 'desa')
                if (controls.ACCEPT)
                    {
                        FlxG.sound.play(Paths.sound('confirmMenu'));
                        CoolUtil.browserLoad('https://desakobold.com');
                    }
    }

    function changeSelection(change:Int = 0) {


        if (!ClientPrefs.data.disableScrollSound)
        {
        FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        curSelected += change;
        if (curSelected < 0)
            curSelected = galleryImages.length - 1;
        if (curSelected >= galleryImages.length)
            curSelected = 0;

        galleryImage.destroy();
        if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') != true) 
            {
                if (!FileSystem.exists('./assets/images/BGCharacters/' + galleryImages[curSelected] + '.png') == true || ClientPrefs.data.lowQuality)
                    {
                trace(path + galleryImages[curSelected] + '.png Found!');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/bonus/' + galleryImages[curSelected]));
                isAnimated = false;
                    }
            }
            else if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') == true)
            {
                
                path = './assets/images/BGCharacters/';
                if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') != true && !ClientPrefs.data.lowQuality) 
                    {
                        galleryImage = new FlxSprite().loadGraphic(Paths.image('BGCharacters/' + galleryImages[curSelected]));
                        galleryImage.animation.addByPrefix('Idle', 'idle');
                        galleryImage.animation.addByPrefix('Sign', 'cheer');
                        isAnimated = true;
                    }
                    else
                        {
                        trace(path + galleryImages[curSelected] + '.png Not found! oops. if low quality is on');
                        galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/missing'));
                        isAnimated = false;
                        }
            }
            switch (galleryImages[curSelected].toLowerCase())
            {
                default:
                    galleryImage.x = (FlxG.width * 0.1);
                    galleryImage.y = (FlxG.height * 0.25);

                case 'mcbf':
                    galleryImage.setGraphicSize(512);
                    galleryImage.x = (FlxG.width * 0.05);
                    galleryImage.y = (FlxG.height * 0.15);
                    galleryImage.flipX = true;
                 case 'desa':
                    galleryImage.setGraphicSize(512);
                    galleryImage.x = (FlxG.width * 0.05);
                    galleryImage.y = (FlxG.height * 0.05);
            }
            
            galleryImage.updateHitbox();
            galleryImage.antialiasing = ClientPrefs.data.antialiasing; // uhh it looks like shit without this lol.
            add(galleryImage);

            descriptionText.destroy();
            descriptionText = new FlxText(FlxG.width * 0.615, 4, 0,  descTextField[curSelected], 20);
            descriptionText.setFormat("VCR OSD Mono", 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(descriptionText);
    if (!ClientPrefs.data.lowQuality && isAnimated == true)
    {
                var random:Int = FlxG.random.int(0, 10);
                switch (random)
                {
                    default:
                        galleryImage.animation.play('Idle');
                    case (8):
                        galleryImage.animation.play('Sign');
                }
    }
}
}

package states.gallery;

import states.gallery.MasterGalleryMenu;

// cant find files if you dont have the damn LIBRARIES
import sys.FileSystem;
import sys.io.File;

class MainGalleryState extends MusicBeatState
{
    var path:String = './assets/images/gallery/main/';
    var galleryImage:FlxSprite;
    var descriptionText:FlxText;
    var descTextField:Array<String> = [
        'IM WORKIN ON IT'
    ];
    var galleryImages:Array<String> = [
        'default'
    ];
    private var curSelected = 0;

    override function create() {
        //FlxG.camera.bgColor = FlxColor.WHITE;
        trace('Main Gallery');
        FlxG.sound.playMusic(Paths.music('tea-time', 'shared'), 2);
        #if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Browsing the Gallery | Browsing Main Gallery Images", null);
		#end

        var BG = new FlxSprite().loadGraphic(Paths.image('gallery/bg/GalleryBGOrange'));
        BG.setGraphicSize(1350);
        BG.updateHitbox();
        BG.screenCenter();
		add(BG);

        if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') != true) 
            {
                trace(path + galleryImages[curSelected] + '.png Found!');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/main/' + galleryImages[curSelected]));
            }
            else if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') == true)
            {
                trace(path + galleryImages[curSelected] + '.png Not found! oops. check the path again.');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/missing'));
            }
            galleryImage.x = (FlxG.width * 0.1);
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
                trace(path + galleryImages[curSelected] + '.png Found!');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/main/' + galleryImages[curSelected]));
            }
            else if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') == true)
            {
                trace(path + galleryImages[curSelected] + '.png Not found! oops. check the path again.');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/missing'));
            }
            galleryImage.x = (FlxG.width * 0.1);
            galleryImage.y = (FlxG.height * 0.25);
            galleryImage.updateHitbox();
            galleryImage.antialiasing = ClientPrefs.data.antialiasing; // uhh it looks like shit without this lol.
            add(galleryImage);

            descriptionText.destroy();
            descriptionText = new FlxText(FlxG.width * 0.615, 4, 0, descTextField[curSelected], 20);
            descriptionText.setFormat("VCR OSD Mono", 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            add(descriptionText);
    }
}

package states.gallery;

import states.gallery.MasterGalleryMenu;

// cant find files if you dont have the damn LIBRARIES
import sys.FileSystem;
import sys.io.File;

class StoryGalleryState extends MusicBeatState
{
    var BG:FlxSprite;
    var path:String = './assets/images/gallery/story/';
    var galleryImage:FlxSprite;
    var descriptionText:FlxText;
    var descTextField:Array<String> = [
        "Char Grilled Cheese:
        \nHe's guy is quite the the dumbass. 
        \nBut that doesn't mean he can't tell
        \nwhen he's in danger! its just...
        \nvery very hard to.",
        "Trevor:
        \nThis guy hails from Tridite City!
        \nOne of Char's best friends even if he
        \nhasn't been with him and Plexi much,
        \nbeing called there more often recently.",
        "Plexi:
        \nThis Quirky lil' protogen is one of
        \nChar's best friends!
        \nkeeps Char out of trouble.",
        "Micheal:
        \nEver since they first met,
        \nMicheal has been trying to get back at
        \nChar after he beat him several years ago.",
        "Micheal (Origins Design) 
        \nWIP NAME
        \n",
        "Plexi Fake/Clone
        \nDESCRIPTION TO BE ADDED",
        "Trevor Clone:
        \nDESCRIPTION TO BE ADDED",
        "Trevor Fake:
        \nDESCRIPTION TO BE ADDED",
        "Zavi (Previously Char Fake):
        \nDESCRIPTION TO BE ADDED",
        "Char Clone:
        \nDESCRIPTION TO BE ADDED"
    ];
    var galleryImages:Array<String> = [
        'Char',
        'Trevor',
        'Plexi',
        'Micheal',
        'MichealOrigin',
        'PlexiFC',
        'TrevorC',
        'TrevorF',
        'Zavi',
        'CharC'
    ];
    private var curSelected = 0;

    override function create() {
        // FlxG.camera.bgColor = FlxColor.WHITE;
        trace('Story Gallery');
        #if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Browsing the Gallery | Browsing Story Images", null);
		#end

        BG = new FlxSprite().loadGraphic(Paths.image('menuBG/GalleryBlue'));
        BG.setGraphicSize(1350);
        BG.updateHitbox();
        BG.screenCenter();
		add(BG);
        if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') != true) 
            {
                trace(path + galleryImages[curSelected] + '.png Found!');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/story/' + galleryImages[curSelected]));
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
            // FlxG.camera.bgColor = FlxColor.BLACK;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MasterGalleryMenu());
            }
            if (controls.ACCEPT)
                {
                    if (galleryImages[curSelected].toLowerCase() == 'char')
                        {
                    FlxG.sound.play(Paths.sound('splat'));
                        }
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
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/story/' + galleryImages[curSelected]));
            }
            else if (!FileSystem.exists(path + galleryImages[curSelected] + '.png') == true)
            {
                trace(path + galleryImages[curSelected] + '.png Not found! oops. check the path again.');
                galleryImage = new FlxSprite().loadGraphic(Paths.image('gallery/missing'));
            }

            switch (galleryImages[curSelected].toLowerCase())
            {
            case 'char':
            galleryImage.x = (FlxG.width * 0.06);
            galleryImage.y = (FlxG.height * 0.15);
            case 'michealorigin':
            galleryImage.x = (FlxG.width * 0.05);
            galleryImage.y = (FlxG.height * 0.15);
            galleryImage.flipX = true;
            case 'micheal':
            galleryImage.setGraphicSize(511);
            galleryImage.x = (FlxG.width * 0.05);
            galleryImage.y = (FlxG.height * 0.05);
            case 'plexi':
            galleryImage.setGraphicSize(512);
            galleryImage.x = (FlxG.width * 0.05);
            galleryImage.y = (FlxG.height * 0.15);
            case 'trevor':
            galleryImage.setGraphicSize(384);
            galleryImage.x = (FlxG.width * 0.07);
            galleryImage.y = (FlxG.height * 0.15);
            default:
            galleryImage.x = (FlxG.width * 0.05);
            galleryImage.y = (FlxG.height * 0.25);
            }
            galleryImage.updateHitbox();
            switch (galleryImages[curSelected].toLowerCase())
            {
                default:
                galleryImage.antialiasing = ClientPrefs.data.antialiasing; // uhh it looks like shit without this lol.
                case 'trevor':
                galleryImage.antialiasing = false;
            }
            add(galleryImage);

            descriptionText.destroy();
            descriptionText = new FlxText(FlxG.width * 0.615, 4, 0, descTextField[curSelected], 20);
            descriptionText.setFormat("VCR OSD Mono", 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(descriptionText);
    }
}

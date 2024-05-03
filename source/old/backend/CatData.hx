package backend;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#end
import lime.utils.Assets;
import openfl.utils.Assets as OpenFlAssets;
import tjson.TJSON as Json;
import states.FreeplaySelectState;

typedef CatFile =
{
	// JSON variables
    var catagoryweekList:String; // Used for WeekData.hx
    var catagoryName:String; // used for catagoriesBefore|FreeplaySelectState.hx (CASE SENSITIVE)
    var catagoryColor:Array<Int>; // Used for FreeplaySelectState.hx
    var catStartsUnlocked:Bool; // Used for FreeplaySelectState.hx
	var hiddenUntilUnlocked:Bool; // Used for FreeplaySelectState.hx
	var catagoriesBefore:Array<String>; // Used for FreeplaySelectState.hx (CASE SENSITIVE)
    var catagoryHidden:Bool; // Used for FreeplaySelectState.hx 
}

class CatData {

    public static var catagoriesLoaded:Array<String>;
    public static var catagoryList:Array<String>;
    public var folder:String = '';

    // JSON variables
    var catagoryweekList:String; // Used for WeekData.hx
    var catagoryName:String; // used for catagoriesBefore|FreeplaySelectState.hx (CASE SENSITIVE)
    var catagoryColor:Array<Int>; // Used for FreeplaySelectState.hx
    var catStartsUnlocked:Bool; // Used for FreeplaySelectState.hx
	var hiddenUntilUnlocked:Bool; // Used for FreeplaySelectState.hx
	var catagoriesBefore:Array<String>; // Used for FreeplaySelectState.hx (CASE SENSITIVE)
    var catagoryHidden:Bool; // Used for FreeplaySelectState.hx 

    public static function createCatagoryFile():CatFile
        {
            var catagoryFile:CatFile = {
                catagoryweekList: 'main',
                catagoryName: 'Main',
                catagoryColor: [255, 255, 255],
                catStartUnlocked: true,
                hiddenUntilUnlocked: false,
                catagoriesBefore: ['Main'],
                catagoryHidden: false
            };
        }
        public function new(catagoryFile:CatFile, fileName:String) {
            catagoryweekList = catagoryFile.catagoryweekList;
            catagoryName = catagoryFile.catagoryName;
            catagoryColor = catagoryFile.catagoryColor;
            catStartUnlocked = catagoryFile.catStartUnlocked;
            hiddenUntilUnlocked = catagoryFile.hiddenUntilUnlocked;
            catagoriesBefore = catagoryFile.catagoriesBefore;
            catagoryHidden = catagoryFile.catagoryHidden;

            this.fileName = fileName;
            }

    public static function reloadCatFiles()
        {
            catagoriesLoaded.clear();
            catagoryList = [];
            #if MODS_ALLOWED
		var directories:Array<String> = [Paths.mods(), Paths.getPreloadPath()];
		var originalLength:Int = directories.length;

		for (mod in Mods.parseList().enabled)
			directories.push(Paths.mods(mod + '/'));
		#else
		var directories:Array<String> = [Paths.getPreloadPath()];
		var originalLength:Int = directories.length;
		#end
        }

}
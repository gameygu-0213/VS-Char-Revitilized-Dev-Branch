package backend;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end
import tjson.TJSON as Json;
import states.PlayState;

typedef RatingStuffJson =
{
    var ratingStuff:Array<Dynamic>;
}

class RatingStuff {
    public static function defaultRatings():RatingStuffJson {
        trace('LOADING DEFAULT RATINGS');
        return{
            ratingStuff: [ // todo: make rating stuff affectable via mods lmao.
            ["You're getting Char-red.", 0.2], //From 1% to 19%
            ['HIT. THE. BULLETS. uhhh, i mean the NOTES.', 0.4], //From 20% to 39%
            ['Coordination, do you have it?', 0.5], //From 40% to 49%
            ['Try a LITTLE harder.', 0.6], //From 50% to 59%
            ['Heyyy, thats pretty good.', 0.69], //From 60% to 68%
            ['Heh, Nice *Thumbs up*', 0.7], //69%
            ['Good, B', 0.8], //From 70% to 79%
            ['Nice! A', 0.9], //From 80% to 89%
            ['WOAH! AAA+', 1], //From 90% to 99%
            ['Perfect!! are you a bot or smth? AAAAA+!', 1] //The value on this one isn't used actually, since Perfect is always "1"
        ]
    };
    }

    public static function getRatingsData():RatingStuffJson {
		var rawJson:String = null;
		var path:String = Paths.getPreloadPath('data/ratings.json');
		trace('GETTING RATINGS FROM DATA');

		#if MODS_ALLOWED
		var modPath:String = Paths.modFolders('data/ratings.json');
		if(FileSystem.exists(modPath)) {
			trace('USING DATA MODPATH');
			rawJson = File.getContent(modPath);
		} else if(FileSystem.exists(path)) {
			trace('USING DATA PRELOAD PATH');
			rawJson = File.getContent(path);
		}
		#else
		if(Assets.exists(path)) {
			rawJson = Assets.getText(path);
		}
		#end
		else
		{
			trace('RATINGS NOT FOUND IN THE DATA FOLDER');
			return null;
		}
		return cast Json.parse(rawJson);
	}

    public static function getRatingsDataFromSong(song:String):RatingStuffJson {
		var rawJson:String = null;
		var path:String = Paths.getPreloadPath('data/' + Paths.formatToSongPath(song) + '/ratings.json');
		trace('GETTING RATINGS FROM THE SONG');

		#if MODS_ALLOWED
		var modPath:String = Paths.modFolders('data/' + Paths.formatToSongPath(song) + '/ratings.json');
		if(FileSystem.exists(modPath)) {
			trace('USING SONG MODPATH');
			rawJson = File.getContent(modPath);
		} else if(FileSystem.exists(path)) {
			trace('USING SONG PRELOAD PATH');
			rawJson = File.getContent(path);
		}
		#else
		if(Assets.exists(path)) {
			rawJson = Assets.getText(path);
		}
		#end
		else
		{
			trace('RATINGS NOT FOUND IN THE SONG FOLDER');
			return null;
		}
		return cast Json.parse(rawJson);
	}
}
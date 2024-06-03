package backend;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end
import tjson.TJSON as Json;
import states.PlayState;

typedef CreditsJson = {
	var songName:String;
	var songArtistText:String;
	var artistText:String;
	var charterText:String;
	var timeShown:Int;
	var boxWidth:Int;
}

class CreditsData
{
    public function getDefaultCredits()
    {
        return {
            songName: "NOT SPECIFIED",
            songArtistText: "NOT SPECIFIED",
            artistText: "NOT SPECIFIED",
            charterText: "NOT SPECIFIED",
            timeShown: 5,
            boxWidth: 500
        };
    }
    var path = './assets/songs/' + PlayState.SONG.song + '/';
    public function loadCredits()
        {
            if (!FileSystem.exists(path + 'credits.json') == true)
                {
                    if (!FileSystem.exists(path + 'Credits.json') != true)
                        {
                            return cast Json.parse(path + 'Credits.json');
                        } else {
                            trace("FILE DOESN'T EXIST LOADING DEFAULT");
                            return cast getDefaultCredits();
                        }
                } else {
                    return cast Json.parse(path + 'credits.json');
                }
            
        }
}
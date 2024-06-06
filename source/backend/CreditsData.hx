package backend;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end
import tjson.TJSON as Json;
import states.PlayState;
import flixel.addons.ui.U;

typedef CreditsFile = 
{
	var songName:String;
	var songArtist:String;
	var artist:String;
	var charter:String;
	var timeShown:Int;
	var boxWidth:Int;
}

class CreditsData
{
	public static var isFreeplay:Bool = false;
	public static function dummy(song:String):CreditsFile
	{
		if (!isFreeplay) {
        trace('USING HARDCODED CREDITS VARIABLES, "credits.json" DOES NOT EXIST');
		}
            switch (Paths.formatToSongPath(song.toLowerCase())) // add some hardcoded shit in case the shit fails lmao.
		{
			default:
                return {
				songName: U.FUL(song),
				songArtist: 'NOT PROVIDED',
				artist: 'NOT PROVIDED',
				charter: 'NOT PROVIDED',
				boxWidth: 500,
				timeShown: 5,
                };
			// Songs from this mod
			case 'defeat-char-mix':
                return {
				songName: 'Defeat Char Mix (Defeat ODDBLUE Mix v1)',
				songArtist: 'WHYEthan (Formerly ODDBLUE)',
				artist: 'Char',
				charter: 'Char',
				boxWidth: 700,
				timeShown: 10,
                };
			case 'triple-trouble':
                return {
				songName: 'Triple Trouble (Char Cover V3)', // songName: 'Triple Trouble Char's Mix'
				songArtist: 'MarStarBro',
				artist: 'Char',
				charter: 'Char (Edited Chart)',
				boxWidth: 600,
				timeShown: 7,
                };
			case 'defeat-odd-mix':
                return {
				songName: 'Defeat ODDBLUE Mix',
				songArtist: 'WHYEthan (Formerly ODDBLUE)',
				artist: 'Char',
				charter: 'Char',
				boxWidth: 500,
				timeShown: 10,
                };
			case 'high-ground':
                return {
				songName: 'High Ground (V7)',
				songArtist: 'WHYEthan (Formaly ODDBLUE)',
				artist: 'Char - (Opponent, Opponent NoteSkins)
				\nMC07 - (Player, Player Noteskins, BG Sprite)',
				charter: 'Char',
				boxWidth: 600,
				timeShown: 10,
                };
			case 'higher-ground':
                return {
				songName: "High Ground Char's Mix",
				songArtist: 'WHYEthan (Formaly ODDBLUE)',
				artist: 'Char - (Opponent, Opponent NoteSkins)
				\nMC07 - (Player, Player Noteskins, BG Sprite)',
				charter: 'Char',
				boxWidth: 600,
				timeShown: 10,
                };
			case 'pico2':
                return {
				songName: 'Pico 2 THE BEST PICO EVER',
				songArtist: 'Relgaoh',
				artist: 'Unknown due to Mod Privatization,\nbut likely IceSoundCat6',
				charter: 'Char',
				boxWidth: 500,
				timeShown: 7,
                };







				
				// Base Game
				case 'tutorial':
				return {
				songName: 'Tutorial',
				songArtist: 'Kawai Sprite',
				artist: 'PhantomArcade, EvilSk8er',
				charter: ':Shrug: but probably Ninjamuffin99',
				boxWidth: 500,
				timeShown: 5,
				};
			case 'bopeebo':
				return {
					songName: 'Bopeebo',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'fresh':
				return {
					songName: 'Fresh',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'dad-battle':
				return {
					songName: 'Dad Battle',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably either Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'spookeez':
				return {
					songName: 'Spookeez',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'south':
				return {
					songName: 'South',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'monster':
				return {
					songName: 'Monster',
					songArtist: 'BassetFilms',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'pico':
				return {
					songName: 'Pico',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'philly-nice':
				return {
					songName: 'Philly Nice',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'blammed':
				return {
					songName: 'Blammed',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'satin-panties':
				return {
					songName: 'Satin Panties',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'high':
				return {
					songName: 'High',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'milf':
				return {
					songName: 'MILF',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'cocoa':
				return {
					songName: 'Cocoa',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'eggnog': // my favorite from week 5 lmao
				return {
					songName: 'Eggnog',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
				};
			case 'winter-horrorland':
				return {
					songName: 'Winter Horrorland',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'senpai':
				return {
					songName: 'Senpai',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'roses':
				return {
					songName: 'Roses',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'thorns':
				return {
					songName: 'Thorns',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'ugh':
				return {
					songName: 'Ugh',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'guns':
				return {
					songName: 'Guns',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'stress':
				return {
					songName: 'Stress',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};

			// In case someone tries any funny business with weekend1, and makes/uses a psych port lmao
			case 'darnell':
				return {
					songName: 'Darnell',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'lit-up':
				return {
					songName: 'Lit Up',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case '2hot':
				return {
					songName: '2Hot',
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
			case 'blazin':
				return {
					songName: "Blazin'",
					songArtist: 'Kawai Sprite',
					artist: 'PhantomArcade, EvilSk8er',
					charter: ':Shrug: but probably Ninjamuffin99',
					boxWidth: 500,
					timeShown: 5,
					};
	}
}
    
    // stolen from StageData lmao
    public static function getCreditsFile(song:String):CreditsFile {
		var rawJson:String = null;
		var path:String = Paths.getPreloadPath('data/' + Paths.formatToSongPath(song) + '/credits.json');
		if (!isFreeplay) {
		trace('The path is: ' + path);
		}

		#if MODS_ALLOWED
		var modPath:String = Paths.modFolders('data/' + Paths.formatToSongPath(song) + '/credits.json');
		if(FileSystem.exists(modPath)) {
			if (!isFreeplay) {
			trace('USING MODPATH');
			}
			rawJson = File.getContent(modPath);
		} else if(FileSystem.exists(path)) {
			if (!isFreeplay) {
			trace('USING PRELOAD PATH');
			}
			rawJson = File.getContent(path);
		}
		#else
		if(Assets.exists(path)) {
			rawJson = Assets.getText(path);
		}
		#end
		else
		{
			return null;
		}
		return cast Json.parse(rawJson);
	}
}
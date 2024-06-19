package backend;

class Achievements {
	public static var achievementsStuff:Array<Dynamic> = [ //Name, Description, Achievement save tag, Hidden achievement
		["Freaky on a Friday Night",	"Play on a Friday... Night.",						'friday_night_play',	 	 true],
		["Triple Trouble, Triple Schmouble", "Beat Triple Trouble with no Misses", 			"chartt_nomiss",			 false],
		["I have the HIGHEST ground.", 		 "Beat High Ground with no Misses",				"high-ground_nomiss", 	 	 false],
		["The real imposter was the friends we made along the way", "Beat the Defeat Mixes with no Misses", "charissus_nomiss", false],
		["PICO 2 BEST PICO EVER", 		"Beat Pico 2 with no misses", 						"pico2_nomiss",				 false],
		["Tutorial Master", 			"Beat Tutorial Char's mix with no misses",          "tutorial_nomiss",           false],
		["BONUS ZONE", 					 "Get and keep all of the Rings in Triple Trouble", "max_rings", 			 	 true],
		["What a Funkin' Disaster!",	"Complete a Song with a rating lower than 20%.",	'ur_bad',					false],
		["Perfectionist",				"Complete a Song with a rating of 100%.",			'ur_good',					false],
		["Oversinging Much...?",		"Hold down a note for 10 seconds.",					'oversinging',				false],
		["Hyperactive",					"Finish a Song without going Idle.",				'hype',						false],
		["Just the Two of Us",			"Finish a Song pressing only two keys.",			'two_keys',					false],
		["Toaster Gamer",				"Have you tried to run the game on a toaster?",		'toastie',					false],
		["Debugger",					"Beat the \"Test\" Stage from the Chart Editor.",	'debugger',					 true],
	];
	public static var achievementsMap:Map<String, Bool> = new Map<String, Bool>();

	public static var henchmenDeath:Int = 0;
	public static function unlockAchievement(name:String):Void {
		FlxG.log.add('Completed achievement "' + name +'"');
		achievementsMap.set(name, true);
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	}

	public static function isAchievementUnlocked(name:String) {
		if(achievementsMap.exists(name) && achievementsMap.get(name)) {
			return true;
		}
		return false;
	}

	public static function getAchievementIndex(name:String) {
		for (i in 0...achievementsStuff.length) {
			if(achievementsStuff[i][2] == name) {
				return i;
			}
		}
		return -1;
	}

	public static function loadAchievements():Void {
		if(FlxG.save.data != null) {
			if(FlxG.save.data.achievementsMap != null) {
				achievementsMap = FlxG.save.data.achievementsMap;
			}
			if(henchmenDeath == 0 && FlxG.save.data.henchmenDeath != null) {
				henchmenDeath = FlxG.save.data.henchmenDeath;
			}
		}
	}
}
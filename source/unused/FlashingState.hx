// making my own to combine the 2 and also cache shit.
package states;

class FlashingState extends MusicBeatState
{
	MusicBeatState.switchState(new CacheState());
}

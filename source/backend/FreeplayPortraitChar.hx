package backend;

typedef FreeplayPortrait = {
    var char:String;
    var playerName:String;
}

class FreeplayPortraitChar
{
    public static function returnChar(song:String):FreeplayPortrait
        {
            switch(Paths.formatToSongPath(song).toLowerCase())
            {
                default:
                    return {
                        char: 'Missing',
                        playerName: 'Unknown'
                    }
                case 'defeat-odd-mix':
                    return {
                        char: 'CharMongusB',
                        playerName: 'Boyfriend'
                    }
                case 'defeat-char-mix':
                    return {
                        char: 'CharMongusB',
                        playerName: 'Boyfriend'
                    }
                case 'pico2':
                    return {
                        char: 'Pico',
                        playerName: 'Pico'
                    }
                case 'tutorial':
                    return {
                    char: 'Bf', // char: 'Char', // *That one line in meet the Medic* Later.
                    playerName: 'Boyfriend' // playerName: 'Char' // *That one line in meet the Medic* Later.
                    }
                case 'triple-trouble':
                    return {
                        char: 'TripleTrouble',
                        playerName: 'Plexi'
                    }
                case 'triple-trouble-char-mix':
                    return {
                        char:'TripleTroubleCharMix',
                        playerName: '???'
                    }
                case 'high-ground':
                    return {
                        char: 'McbfChair',
                        playerName: 'MCBF Chair (MCBF V1)'
                    }
                case 'iason-mason':
                    return {
                        char: 'CharLQ',
                        playerName: 'Hue Shifted Char'
                    }
                case 'junkyard':
                    return {
                        char: 'Junkyard',
                        playerName: 'Snoopy' //"Char (Funkin' Peanuts Style)"
                    }
                case 'darnell':
                    return {
                        char: 'Pico',
                        playerName: 'Pico'
                    }
                case 'lit-up':
                    return {
                        char: 'Pico',
                        playerName: 'Pico'
                    }
                case '2hot':
                    return {
                        char: 'Pico',
                        playerName: 'Pico'
                    }
                case 'blazin':
                    return {
                        char: 'Pico',
                        playerName: 'Pico'
                    }
            }
        }
}
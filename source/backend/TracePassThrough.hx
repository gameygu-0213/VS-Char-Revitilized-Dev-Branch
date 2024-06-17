package backend;

// simple, adds extra shiz yknow. formatting.
class TracePassThrough
{
    static var txt:String;
    public static function trace(v:Dynamic, type:String = 'default', ?infos:haxe.PosInfos)
        {
            switch(type.toLowerCase())
            {
                default:
                    txt = infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v);
                case 'warning':
                    txt = infos.fileName + ':' + infos.lineNumber + ':WARN: ' + Std.string(v);
                case 'warn':
                    txt = infos.fileName + ':' + infos.lineNumber + ':WARN: ' + Std.string(v);
                case 'error':
                    txt = infos.fileName + ':' + infos.lineNumber + ':ERR: ' + Std.string(v);
                case 'err':
                    txt = infos.fileName + ':' + infos.lineNumber + ':ERR: ' + Std.string(v);
                case 'fatal':
                    txt = infos.fileName + ':' + infos.lineNumber + ':FATAL: ' + Std.string(v);
                case 'info':
                    txt = infos.fileName + ':' + infos.lineNumber + ':INFO: ' + Std.string(v);
            }
            haxe.Log.trace(txt, null);
            FlxG.log.add(txt);
        }
}
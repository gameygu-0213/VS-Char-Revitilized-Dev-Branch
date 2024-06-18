package backend;

import flixel.system.debug.log.LogStyle;
// simple, adds extra shiz yknow. formatting. also adds to the Haxe Core Debugger Log
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
            switch(type.toLowerCase())
            {
                default:
                    FlxG.log.add(txt);
                case 'warning':
                    FlxG.log.advanced(infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v), LogStyle.WARNING);
                case 'warn':
                    FlxG.log.advanced(infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v), LogStyle.WARNING);
                case 'error':
                    FlxG.log.advanced(infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v), LogStyle.ERROR);
                case 'err':
                    FlxG.log.advanced(infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v), LogStyle.ERROR);
                case 'fatal':
                    FlxG.log.advanced(infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v), LogStyle.ERROR);
                case 'info':
                    FlxG.log.advanced(infos.fileName + ':' + infos.lineNumber + ':' + Std.string(v), LogStyle.NOTICE);
            }
        }
}
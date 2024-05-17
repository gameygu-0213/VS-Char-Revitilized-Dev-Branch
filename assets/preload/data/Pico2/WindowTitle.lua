function onBeatHit()
if curBeat == 1 then
setPropertyFromClass("openfl.Lib","application.window.title","Friday Night Funkin': VS Char Revitalized | Now Playing | Pico 2 | Relgaoh | Chart by Char")
end
end
function onDestroy()
setPropertyFromClass("openfl.Lib","application.window.title","Friday Night Funkin': VS Char Revitalized")
end
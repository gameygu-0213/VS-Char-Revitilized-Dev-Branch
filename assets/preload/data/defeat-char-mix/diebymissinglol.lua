function onUpdate(elapsed)
-- Kills you if you miss 5 times lol
misses = getProperty('songMisses')
if getProperty('songMisses') >= 10 then
setProperty('health', 0);
end
if curBeat == 327 then
setProperty('health', 1)
end
end

function onUpdatePost()
if curBeat < 327 or curBeat > 399 then
    if ratingFC == '' then -- if the FC is nothing
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' / 10 | Accuracy: 0%')
        setTextFont('scoreTxt', 'QuicksilverItalic.ttf');
    else
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. ' / 10 | Accuracy: ' ..round(rating * 100, 2).. '% [' ..ratingFC..']')
    end
if getProperty('songMisses') >= 10 then
	setTextColor('scoreTxt', '802B00') --uses a hex code to change text color
else
	setTextColor('scoreTxt', 'FFCB0D') --uses a hex code to change text color
end
end

if curBeat > 327 and curBeat < 399 then
    if ratingFC == '' then -- if the FC is nothing
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Combo Breaks: ' .. misses .. ' | Accuracy: 0%')
        setTextFont('scoreTxt', 'QuicksilverItalic.ttf');
    else
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Combo Breaks: ' .. misses .. ' | Accuracy: ' ..round(rating * 100, 2).. '% [' ..ratingFC..']')
    end
	setTextColor('scoreTxt', 'FFFFFF') --to make sure the color is reset
end
end

function round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

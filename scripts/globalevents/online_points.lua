local onlinePoints = GlobalEvent("onlinePoints")
function onlinePoints.onThink(interval)
	for _, player in ipairs(Game.getPlayers()) do
		player:addOnlinePoint()
	end
    return true
end

onlinePoints:interval(3600000)
onlinePoints:register()

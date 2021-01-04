-- adicionar ao seu player.lua

--online points
function Player.addOnlinePoint(self)
	local points = self:getStorageValue(ONLINE_POINTS)
	local current = math.max(0, points)
	self:setStorageValue(ONLINE_POINTS, current + 1)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been online for an hour and have earned 1 online point.")
end

function Player.getOnlinePoint(self)
	local points = self:getStorageValue(ONLINE_POINTS)
	return math.max(0, points)	
end

function Player.removeOnlinePoint(self, amount)
	local points = self:getStorageValue(ONLINE_POINTS)
	local current = math.max(0, points)
	self:setStorageValue(ONLINE_POINTS, current - amount)
end

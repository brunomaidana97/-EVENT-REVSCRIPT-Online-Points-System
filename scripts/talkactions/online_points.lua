local onlinePoints = TalkAction("!onlinepoints")

function onlinePoints.onSay(player, words, param)
			if player:getOnlinePoint() > 0 then
				local points = player:getStorageValue(ONLINE_POINTS)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('You have %d online points.', points))
					else					
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dont have online points.')
		end
end

onlinePoints:register()

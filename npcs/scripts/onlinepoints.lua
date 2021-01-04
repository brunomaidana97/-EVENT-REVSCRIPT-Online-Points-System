 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = '' },
}

npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	
	
	if msgcontains(msg, "exercise weapon") then
		npcHandler:say("Do you want to buy for exercise with 250 charges. {club}, {axe}, {sword}, {bow}, {rod} or {wand}? ", cid)
		npcHandler.topic[cid] = 23
	end
	
	if msgcontains(msg, "club") and npcHandler.topic[cid] == 23 then
		npcHandler:say("Do you want to buy exercise club with 250 charges with 250 charges for 3 online points?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:getOnlinePoint() >= 3 then
			player:removeOnlinePoint(3)
			npcHandler:say("whoooosh There!", cid)
			player:addItem(32386, 250)
		else
			npcHandler:say("You dont have online points.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "axe") and npcHandler.topic[cid] == 23 then
		npcHandler:say("Do you want to buy exercise axe with 250 charges for 3 online points?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 2 then
		if player:getOnlinePoint() >= 3 then
			player:removeOnlinePoint(3)
			npcHandler:say("whoooosh There!", cid)
			player:addItem(32385, 250)
		else
			npcHandler:say("You dont have online points.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "sword") and npcHandler.topic[cid] == 23 then
		npcHandler:say("Do you want to buy exercise sword with 250 charges for 3 online points?", cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 3 then
		if player:getOnlinePoint() >= 3 then
			player:removeOnlinePoint(3)
			npcHandler:say("whoooosh There!", cid)
			player:addItem(32384, 250)
		else
			npcHandler:say("You dont have online points.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "bow") and npcHandler.topic[cid] == 23 then
		npcHandler:say("Do you want to buy exercise bow with 250 charges for 3 online points?", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 4 then
		if player:getOnlinePoint() >= 3 then
			player:removeOnlinePoint(3)
			npcHandler:say("whoooosh There!", cid)
			player:addItem(32387, 250)
		else
			npcHandler:say("You dont have online points.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "rod") and npcHandler.topic[cid] == 23 then
		npcHandler:say("Do you want to buy exercise rod with 250 charges for 3 online points?", cid)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 5 then
		if player:getOnlinePoint() >= 3 then
			player:removeOnlinePoint(3)
			npcHandler:say("whoooosh There!", cid)
			player:addItem(32388, 250)
		else
			npcHandler:say("You dont have online points.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "wand") and npcHandler.topic[cid] == 23 then
		npcHandler:say("Do you want to buy exercise wand with 250 charges for 3 online points?", cid)
		npcHandler.topic[cid] = 6
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 6 then
		if player:getOnlinePoint() >= 3 then
			player:removeOnlinePoint(3)
			npcHandler:say("whoooosh There!", cid)
			player:addItem(32389, 250)
		else
			npcHandler:say("You dont have online points.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "exp boost") then
		npcHandler:say("Do you want to buy 50% of exp boost for 24 online points?", cid)
		npcHandler.topic[cid] = 7
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 7 then
			if player:getOnlinePoint() >= 24 then
				player:removeOnlinePoint(24)
				npcHandler:say("whoooosh There!", cid)
					local currentExpBoostTime = player:getExpBoostStamina()
						player:setStoreXpBoost(50)
						player:setExpBoostStamina(currentExpBoostTime + 3600)
			else
				npcHandler:say("You dont have online points", cid)
			end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "all bless") or msgcontains(msg, "blessings") then
		npcHandler:say("Do you want to buy all blessings for 5 online points?", cid)
		npcHandler.topic[cid] = 8
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 8 then
			if player:getOnlinePoint() >= 5 then
				if player:hasBlessing(8) then
					npcHandler:say("You already have all Blessings!", cid)
				else
					player:removeOnlinePoint(5)
					npcHandler:say("whoooosh There!", cid)
					player:addMissingBless(true)
				end
			else
				npcHandler:say("You dont have online points", cid)
			end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "prey bonus reroll 5x") or msgcontains(msg, "prey reroll") then
		npcHandler:say("Do you want to buy 5x prey bonus reroll for 15 online points?", cid)
		npcHandler.topic[cid] = 9
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 9 then
			if player:getOnlinePoint() >= 15 then
				player:removeOnlinePoint(15)
				player:setPreyBonusRerolls(player:getPreyBonusRerolls() + 5)
				npcHandler:say("whoooosh There!", cid)
			else
				npcHandler:say("You dont have online points", cid)
			end
		npcHandler.topic[cid] = 0
	end
	
	if msgcontains(msg, "instant reward access 5x") or msgcontains(msg, "instant reward") then
		npcHandler:say("Do you want to buy 5x instant reward access for 7 online points?", cid)
		npcHandler.topic[cid] = 10
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 10 then
			if player:getOnlinePoint() >= 7 then
				player:removeOnlinePoint(7)
				player:setCollectionpointss(player:getCollectionpointss() + 5)
				npcHandler:say("whoooosh There!", cid)
			else
				npcHandler:say("You dont have online points", cid)
			end
		npcHandler.topic[cid] = 0
	end
		
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local t = {
          [20620] = {price = 20, price2 = 0}, -- [ITEMID TO SELL] = {Buy cost (0 = not buyable), sell cost (0 = not sellable)}
          [31719] = {price = 20, price2 = 0},
          [31721] = {price = 20, price2 = 0},
          [31720] = {price = 20, price2 = 0},
          [10511] = {price = 20, price2 = 0},
          [10513] = {price = 20, price2 = 0},
          [10515] = {price = 20, price2 = 0},
		  [5908] = {price = 20, price2 = 0},
		  [5942] = {price = 20, price2 = 0}
          }

local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
	if player:getOnlinePoint() < t[item].price*amount then
		selfSay("You don't have enough online points.", cid)
	else
		doPlayerAddItem(cid, item, amount)
		player:removeOnlinePoint(t[item].price*amount)
		doPlayerSendTextMessage(cid, 20, "You have bought " .. amount .. "x " .. getItemName(item) .. " for " .. t[item].price*amount .. " online points.")
	end
	return true
end

if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
	for var, ret in pairs(t) do
		table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = ret.price2, name = getItemName(var)})
	end
	openShopWindow(cid, shopWindow, onBuy, onSell)
		end

	return true
end

keywordHandler:addKeyword({'items'}, StdModule.say, {npcHandler = npcHandler, text = 'I have several types of {exercise weapons}.'})
keywordHandler:addKeyword({'others'}, StdModule.say, {npcHandler = npcHandler, text = 'How nice! Then browse my catalog of other stuff and let me know if something interests you: {all bless}, {prey bonus reroll 5x}, {instant reward access 5x} and {exp boost}.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye |PLAYERNAME|.")
npcHandler:addModule(FocusModule:new())

------------------------------------------------
-- 文件名    :  DefaultBuff.lua
-- 创建人    :  CBG
-- 创建时间  :  2011-04-16
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local player = GetPlayer(nCharacterID)
    if player then 
    	if nLeftFrame > 0 then
			player.AddBuff(0, 99, 562, 5, math.floor(4*nLeftFrame/8))
		end
    end
    if not player then
	    local npc = GetNpc(nCharacterID)
		if not npc then 
	   		return
		end
		if nLeftFrame > 0 then
			npc.AddBuff(0, 99, 562, 5, math.floor(4*nLeftFrame/8))
		end
    end
end
function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
    local player = GetPlayer(nCharacterID)
    if player then 
    	if nLeftFrame > 0 then
			player.AddBuff(0, 99, 562, 5, math.floor(4*nLeftFrame/8))
		end
    end
    if not player then
    	local npc = GetNpc(nCharacterID)
	if not npc then 
    	        return
	end
	if nLeftFrame > 0 then
		npc.AddBuff(0, 99, 562, 5, math.floor(4*nLeftFrame/8))
	end
    end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-16
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
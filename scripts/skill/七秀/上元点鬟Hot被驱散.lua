------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  ���
-- ����ʱ��  :  2009-04-16
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
        return
    end
    local player = GetPlayer(nCharacterID)
    local npc = GetNpc(nCharacterID) 
    if nLeftFrame > 0 then	    -- ��Ԫ������ǰ��ʧ
		if player then
			player.DelBuff(3830, nBuffLevel)
		end
		if npc then
			npc.DelBuff(3830, nBuffLevel)
		end
    end
end

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 and player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.06
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
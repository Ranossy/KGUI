---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_�߻���ħ.lua
-- ����ʱ��:	2014/10/2 19:32:56
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetPlayer(nCharacterID)
	if not npc or npc.bFightState ~= true then
		return
	end

	npc.FireAIEvent(2008, 0, 0)
	
--[[
	if nLeftFrame == 0 then    -----��Ȼ�����������ǿBUFF
		local LV = 1
		if scene.dwMapID ~= 192 then
			LV = 2
		end
		player.AddBuff(0, 99, 8342, LV)
	else                       --��ǰ��������BOSS���¼�
		
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/ͻ����.lua
-- ����ʱ��:	2013/10/21 14:43:56
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--Ľ�����ͻbuff
	if player.GetSkillLevel(6511) == 1 then
		if player.GetBuff(7671, 1) then
			player.DelGroupBuff(7671, 1)
		end
		player.AddBuff(dwCharacterID, player.nLevel, 7671, 1, 45)
	end
	
	if player.GetSkillLevel(5675) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 5641, 1, 1)
	end
	--[[
	if player.GetSkillLevel(6514) == 1 then
		if not player.GetBuff(6125, 1) then
			player.AddBuff(player.dwID, player.nLevel, 6124, 1, 1)
		else
			player.DelBuff(6125, 1)
		end
	end
	if player.GetBuff(6125, 1) then
		player.DelBuff(6125, 1)
	end
	--]]

	--ͻ�����
	if player.GetSkillLevel(6514) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 6361, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
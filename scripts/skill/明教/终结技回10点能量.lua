---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�սἼ��10������.lua
-- ����ʱ��:	2015/9/21 15:53:49
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(6722) == 1 then
		player.SetTimer(4, "scripts/skill/����/�սἼ��10������.lua", nParam1, nParam2)
		--player.nCurrentMoonEnergy = player.nCurrentMoonEnergy + 1000
		--player.nCurrentSunEnergy = player.nCurrentSunEnergy + 1000
	end
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.nCurrentMoonEnergy = player.nCurrentMoonEnergy + 1000
	player.nCurrentSunEnergy = player.nCurrentSunEnergy + 1000
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
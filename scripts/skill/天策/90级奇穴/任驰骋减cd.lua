---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/�γ۳Ҽ�cd.lua
-- ����ʱ��:	2013/5/28 22:18:53
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	ModityCDToUI(player, 433, 0, 0)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6515) == 1 then
		if not player.GetBuff(6127, 1) then
			if player.GetCDLeft(108) ~= 0 then
				player.AddBuff(dwCharacterID, player.nLevel, 6126, 1, 1)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
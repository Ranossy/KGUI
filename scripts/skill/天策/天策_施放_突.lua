---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_ʩ��_ͻ.lua
-- ����ʱ��:	2013/4/17 20:45:58
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(418)   --���ĸ���� ͻ �ĵȼ�
	player.PlaySfx(38, player.nX, player.nY, player.nZ)
	--[[
	if player.GetSkillLevel(6511) == 1 then
		player.CastSkill(9127, dwSkillLevel)	--ͻ�˺�
	else
		player.CastSkill(431, dwSkillLevel)		--���������˺�
	end
	--]]
	if player.GetBuff(9867, 1) then
		player.CastSkill(14882, dwSkillLevel)		--���������˺�
	else
		player.CastSkill(431, dwSkillLevel)		--���������˺�	
	end
	
	
	if player.GetSkillLevel(5700) == 1 then
		player.CastSkill(6072, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
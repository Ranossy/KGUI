---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/�Ʒ��������Ч��.lua
-- ����ʱ��:	2015/6/16 14:50:56
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	--�Ʒ�����
	if player.IsSkillRecipeActive(2005, 1) then
		if player.IsSkillRecipeActive(375, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(8139, 2, TARGET.PLAYER, target.dwID)
			else
				player.CastSkill(8139, 2, TARGET.NPC, target.dwID)
			end
		else
			if IsPlayer(dwCharacterID) then
				player.CastSkill(8139, 1, TARGET.PLAYER, target.dwID)
			else
				player.CastSkill(8139, 1, TARGET.NPC, target.dwID)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/��ħ_�Ʒ總������CD���Ӽ���.lua
-- ����ʱ��:	2014/7/3 15:37:11
-- �����û�:	mengxiangfei
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

	--��S_9290��Ѫ�����Ϣ
	if player.GetSkillLevel(9290) == 1 and player.GetKungfuMount().dwSkillID == 10026 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9291, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(9291, 1, TARGET.NPC, dwCharacterID)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
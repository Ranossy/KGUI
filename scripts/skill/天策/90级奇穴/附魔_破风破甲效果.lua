---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/��ħ_�Ʒ��Ƽ�Ч��.lua
-- ����ʱ��:	2014/6/27 18:39:52
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
	
	local lv = player.GetSkillLevel(401)
	--��S_9282�Ƽ�Ч����Ϊ�ɵ���
	if player.GetSkillLevel(9282) == 1 and player.GetKungfuMount().dwSkillID == 10062 and lv ~= 0 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9284, lv, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(9284, lv, TARGET.NPC, dwCharacterID)
		end
	else
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9283, lv,TARGET.PLAYER,dwCharacterID)
		else
			player.CastSkill(9283, lv,TARGET.NPC,dwCharacterID)
		end
	end
	--[[
	--��S_9290��Ѫ�����Ϣ
	if player.GetSkillLevel(9290) == 1 and player.GetKungfuMount().dwSkillID == 10026 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9291, 1,TARGET.PLAYER,dwCharacterID)
		else
			player.CastSkill(9291, 1,TARGET.NPC,dwCharacterID)
		end
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
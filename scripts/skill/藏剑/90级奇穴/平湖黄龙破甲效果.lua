---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/90����Ѩ/ƽ�������Ƽ�Ч��.lua
-- ����ʱ��:	2014/6/29 17:13:20
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
	
	--[[
	--ƽ�������Ƽ�Ч��
	if player.GetSkillLevel(9289) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 7974, 1)
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
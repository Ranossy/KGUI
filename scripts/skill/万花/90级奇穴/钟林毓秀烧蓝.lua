---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/����ع������.lua
-- ����ʱ��:	2013/7/23 17:56:36
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--����Ч���Ѿ��滻����νű��Ѿ���Ч�ˡ�
	--[[
	local target = GetPlayer(dwCharacterID)
	local i = Random(1, 10)
	if player.GetSkillLevel(5757) == 1 then
		--if i == 1 then
		if target then
			target.nCurrentMana = target.nCurrentMana - target.nMaxMana * 0.01
		end
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.01
		--end
	end
	--]]
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
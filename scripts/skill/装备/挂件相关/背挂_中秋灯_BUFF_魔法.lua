---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_�����_BUFF_ħ��.lua
-- ����ʱ��:	2015/9/16 19:50:46
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetDynamicSkillGroup() == 219 then
		player.SetDynamicSkillGroup(0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/Ԫ��������ά��buff11683.lua
-- ����ʱ��:	2017/2/6 15:52:06
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetDynamicSkillGroup() == 322 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 19303 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 376)
	end
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
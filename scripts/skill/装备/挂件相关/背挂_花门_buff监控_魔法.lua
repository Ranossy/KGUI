---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����_buff���_ħ��.lua
-- ����ʱ��:	2016/11/8 9:44:16
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local npc1 = scene.GetNpcByNickName("fxby_N_fxf201611" .. player.dwID)
	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)

	if npc1 then
		npc1.FireAIEvent(2001, 0, 0)
	end

	if player.GetDynamicSkillGroup() == 313 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 20208  then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 371)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
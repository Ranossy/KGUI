---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����buff���_ħ��.lua
-- ����ʱ��:	2016/9/7 20:20:04
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
	local npc1 = scene.GetNpcByNickName("tree_fxf1609_" .. player.dwID)
	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)

	if npc1 then
		npc1.FireAIEvent(2001, 0, 0)
	end

	if player.GetDynamicSkillGroup() == 304 or  player.GetDynamicSkillGroup() == 306 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 19081  then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 355)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����ɵ�_buff���_ħ��.lua
-- ����ʱ��:	2017/4/18 14:58:32
-- �����û�:	ZHANGYAN0-PC
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
	local npc1 = scene.GetNpcByNickName("rhxd_zy201704" .. player.dwID)
	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)

	if npc1 then
		npc1.FireAIEvent(2001, 0, 0)
	end

	if player.GetDynamicSkillGroup() == 336 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 19438  then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 389)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
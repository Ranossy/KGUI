---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��è����_���buff_ħ��.lua
-- ����ʱ��:	2016/2/20 16:32:39
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
	local npc1 = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)

	if npc1 then
		npc1.FireAIEvent(2001,0,0)
	end
	
	if player.GetDynamicSkillGroup() == 247 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 17236 or player.dwBackItemIndex == 19238 then--������ʱ���ж�
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 321)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
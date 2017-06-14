---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/С��è����_���buff_ħ��.lua
-- ����ʱ��:	2016/4/19 17:20:54
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
	local npc = GetNpc(player.dwFellowPetID)

	if npc then
		if npc.dwTemplateID == 51084 then
			npc.SetDisappearFrames(1, 0)
		end
	end
	
	if player.GetDynamicSkillGroup() == 252 then
		player.SetDynamicSkillGroup(0)
	end

	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex == 17504 or player.dwBackItemIndex == 19262 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 326)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
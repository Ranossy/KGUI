---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��÷_����BUFF���_ħ��.lua
-- ����ʱ��:	2015/11/27 15:43:29
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

	local buff_san = player.GetBuff(1575, 0)
	if buff_san then
		player.DelBuff(1575, buff_san.nLevel)
	end

	local scene = player.GetScene()
	local doodad_now = scene.GetDoodadByNickName("HeMeiZHUOZI_" .. player.dwID)
	if doodad_now then
		doodad_now.SetDisappearFrames(1, 0)
	end

	if player.GetDynamicSkillGroup() == 231 then
		player.SetDynamicSkillGroup(0)
	end

	if player.dwBackItemIndex == 16872 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 315)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
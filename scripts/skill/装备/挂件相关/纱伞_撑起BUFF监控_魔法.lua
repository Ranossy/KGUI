---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ɴɡ_����BUFF���.lua
-- ����ʱ��:	2015/7/29 20:03:19
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

	local buff_san = player.GetBuff(1575, 0)
	if buff_san then
		player.DelBuff(1575, buff_san.nLevel)
	end
	
	local scene = player.GetScene()
	
	local doodad_now = scene.GetDoodadByNickName("ShaSan_" .. player.dwID)
	if doodad_now then
		doodad_now.SetDisappearFrames(1, 0)
	end
	
	if player.GetDynamicSkillGroup() == 201 then
		player.SetDynamicSkillGroup(0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
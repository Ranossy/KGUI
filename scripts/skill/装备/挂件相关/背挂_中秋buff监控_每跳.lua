---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����buff���_ÿ��.lua
-- ����ʱ��:	2016/9/7 20:19:49
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--���BUFF��NPC�������
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.dwBackItemIndex ~= 19081 then
		player.DelBuff(11173, 1)
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("tree_fxf1609_" .. player.dwID)
	if not npc then
		bFLAG = false
	end

	if player.bFightState then
		bFLAG = false
	end

	if player.nMoveState == MOVE_STATE.ON_DEATH then
		bFLAG = false
	end

	if bFLAG then
		if player.GetDynamicSkillGroup() == 0 then
			if scene.dwMapID == 258 then
				player.SetDynamicSkillGroup(306)
			else
				player.SetDynamicSkillGroup(304)
			end
		end
	else
		player.DelBuff(11173, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/С��è����_���buff_ÿ��.lua
-- ����ʱ��:	2016/4/19 17:21:27
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

	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17504 and player.dwBackItemIndex ~= 19262 then
		player.DelBuff(10685, 1)
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = GetNpc(player.dwFellowPetID)
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
			player.SetDynamicSkillGroup(252)
		end
	else
		player.DelBuff(10685, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
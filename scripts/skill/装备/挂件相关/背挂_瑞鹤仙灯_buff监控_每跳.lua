---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����ɵ�_buff���_ÿ��.lua
-- ����ʱ��:	2017/4/18 14:58:20
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--���BUFF��NPC�������
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.dwBackItemIndex ~= 19438 then
		player.DelBuff(11913, 1)
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("rhxd_zy201704" .. player.dwID)
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
			player.SetDynamicSkillGroup(336)
		end
	else
		player.DelBuff(11913, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
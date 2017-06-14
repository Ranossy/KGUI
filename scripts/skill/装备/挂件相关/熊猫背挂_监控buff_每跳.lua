---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��è����_���buff_ÿ��.lua
-- ����ʱ��:	2016/2/20 16:31:26
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
	
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then--������ʱ���ж�
		player.DelBuff(10507, 1)
		return
	end
	
	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
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
			player.SetDynamicSkillGroup(247)
		end
	else
		player.DelBuff(10507, 1)		
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com